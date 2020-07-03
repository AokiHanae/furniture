package com.neusoft.utils;

import com.github.pagehelper.Page;
import com.neusoft.po.ItemUserNum;

import javax.management.AttributeList;
import java.math.BigDecimal;
import java.util.*;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;
import java.util.stream.IntStream;


public class CollaborativeAlgorithm {

    /**
     * 根据所有用户购买列表获取用户推荐列表
     * @param baseUserId
     * @param allList
     */
    public static  List<String> calculate(Integer baseUserId, List<ItemUserNum> allList){
        //所有被用户购买过的商品ID
        Set<Integer> itemIdSet = allList.stream().map(e -> e.getItemId()).collect(Collectors.toSet());
        List<Integer> itemIdList=new ArrayList<>();
        itemIdList.addAll(itemIdSet);
        //保存用户购买的商品ID：userid-itemId+','+itemId
        HashMap<Integer,String> userIdMap=new HashMap<>();
        //保存每个商品购买用户数
        HashMap<Integer,Integer> IdUserNumMap=new HashMap<>();
        //保存baseUserId用户的商品购买
        HashMap<Integer,Integer> IdScoreMap=new HashMap<>();
        allList.forEach(e->{
            Integer itemId = e.getItemId();
            Integer userId = e.getUserId();
            Integer number = e.getNum();
            if(userId==baseUserId.intValue()){
                IdScoreMap.put(itemId,number);
            }
            if(userIdMap.containsKey(userId)){
                String itemIds= userIdMap.get(userId);
                itemIds=itemIds+","+itemId;
                userIdMap.put(userId,itemIds);
            }else{
                String itemIds=new String();
                itemIds=itemIds+itemId;
                userIdMap.put(userId,itemIds);
            }
            if(IdUserNumMap.containsKey(itemId)){
                Integer userNum=IdUserNumMap.get(itemId);
                userNum++;
                IdUserNumMap.put(itemId,userNum);
            }else{
                IdUserNumMap.put(itemId,1);
            }
        });
        if(IdUserNumMap.size()==0||IdScoreMap.size()==0){
            //该用户未购买过任何商品
            return null;
        }

        //计算i j相似度
        HashMap<String,Double> idijMap=new HashMap<>();
        for(int i=0;i<itemIdList.size();i++){
            Integer itemIdI = itemIdList.get(i);
            for(int j=i+1;j<itemIdList.size();j++){
                Integer itemIdJ = itemIdList.get(j);
                //获取i j同时被购买的用户数
                Integer userIdIJNumber = getUserIdIJNumber(itemIdI, itemIdJ, userIdMap);
                //购买i的用户数
                Integer itemIdINum = IdUserNumMap.get(itemIdI);
                //购买j的用户数
                Integer itemIdJNum = IdUserNumMap.get(itemIdJ);
                double sqrt = Math.sqrt(itemIdINum * itemIdJNum);
                //ij相似度
                BigDecimal similarityDegree = new BigDecimal(userIdIJNumber).divide(new BigDecimal(sqrt), 3, BigDecimal.ROUND_HALF_UP);
                idijMap.put(itemIdI+","+itemIdJ,similarityDegree.doubleValue());
            }
        }
        //根据用户购买的每个商品进行相似度推荐
        Set<Integer> keySet = IdScoreMap.keySet();
        //保存每个推荐商品itemId与推荐值
        Map<String,Object> recommendScore=new HashMap<>();
        for(Integer key:keySet){
            //用户对key的购买数
            Integer keyScore = IdScoreMap.get(key);
            //recommendMap里面保存的是用户没有购买的itemId与相似度
            Map<String, Object> recommendMap = getRecommendByItemId(key, idijMap, IdScoreMap);
            if(recommendMap==null||recommendMap.size()==0){
                return null;
            }
            recommendMap.keySet().forEach(e->{
                double degree = (double) recommendMap.get(e);
                if(recommendScore.containsKey(e)){
                    double oldVal = (double) recommendScore.get(e);
                    double newVal=oldVal+degree*keyScore;
                    recommendScore.put(e,newVal);
                }else{
                    double newVal=degree*keyScore;
                    recommendScore.put(e,newVal);
                }
            });
        }
        //取排名前6返回ID列表
        Set<String> keySetRS = recommendScore.keySet();
        if(recommendScore.size()<=6){
            List<String> itemIdListRecommend = keySetRS.parallelStream().collect(Collectors.toList());
            return itemIdListRecommend;
        }else{
            List<String> itemIdListRecommend=new ArrayList<>();
            double sexthDegree = getSexthDegree(recommendScore);
            for(String e:keySetRS){
            	 double degree = (double) recommendScore.get(e);
                 if(itemIdListRecommend.size()==6){
                     break;
                 }
                 if(degree>=sexthDegree){
                     itemIdListRecommend.add(e);
                 }
            }
            return itemIdListRecommend;
        }
    }

    //获取最后推荐列表中第六名的推荐值
    private static double getSexthDegree( Map<String,Object> recommendScore){
        ArrayList<Map.Entry<String, Object>> arrayList = new ArrayList<>(recommendScore.entrySet());
        Collections.sort(arrayList, new Comparator<Map.Entry<String, Object>>() {
            @Override
            public int compare(Map.Entry<String, Object> o1, Map.Entry<String, Object> o2) {
                return o2.getValue().toString().compareTo(o1.getValue().toString());
            }
        });
        if(arrayList.size()<=6){
            Map.Entry<String, Object> objectEntry = arrayList.get(arrayList.size()-1);
            return Double.parseDouble(objectEntry.getValue().toString());
        }
        Map.Entry<String, Object> objectEntry = arrayList.get(5);
        return Double.parseDouble(objectEntry.getValue().toString());
    }

    /**
     * 返回itemId的推荐列表
     * @param itemId 用户购买过的的商品ID
     * @param idijMap 相似度
     * @param IdScoreMap 用户购买过的的商品与数量
     * @return
     */
    private static Map<String,Object> getRecommendByItemId(Integer itemId,HashMap<String,Double> idijMap,HashMap<Integer,Integer> IdScoreMap){
        Map<String,Object> tenMap=new HashMap<>();
        //从idijMap中获取只和itemId有相似度的集合
        HashMap<String,Object> onlyMap=new HashMap<>();
        idijMap.keySet().forEach(e->{
            if(e.contains(itemId.toString())){
                onlyMap.put(e,idijMap.get(e));
            }
        });
        if(onlyMap==null||onlyMap.isEmpty()){
            return null;
        }
        //排序取第十名相似度(如果不够十个返回最后一名相似度)
        double tenthScore = getTenthScore(onlyMap);
        //取10个最高相似度的商品
        Set<String> keySet = onlyMap.keySet();
        for(String e:keySet){
        	 double degree= (double) onlyMap.get(e);
             if(degree>=tenthScore){
                 tenMap.put(e,degree);
                 if(tenMap.size()==10){
                     break ;
                 }
             }
        }
        
        //从10个里面获取用户没有购买过的
        Map<String,Object> recommendMap=new HashMap<>();
        tenMap.keySet().forEach(e->{
            String[] split = e.split(",");
            String currFilmId=null;
            if(split[0].equals(itemId.toString())){
                currFilmId=split[1];
            }else{
                currFilmId=split[0];
            }
            if(!IdScoreMap.containsKey(Integer.parseInt(currFilmId))){
                recommendMap.put(currFilmId,tenMap.get(e));
            }
        });

        return recommendMap;
    }
    //获取相似度中第十名的分值
    private static double getTenthScore(HashMap<String,Object> onlyMap){
        ArrayList<Map.Entry<String, Object>> arrayList = new ArrayList<>(onlyMap.entrySet());
        Collections.sort(arrayList, new Comparator<Map.Entry<String, Object>>() {
            @Override
            public int compare(Map.Entry<String, Object> o1, Map.Entry<String, Object> o2) {
                return o2.getValue().toString().compareTo(o1.getValue().toString());
            }
        });
        if(arrayList.size()<=10){
            Map.Entry<String, Object> objectEntry = arrayList.get(arrayList.size()-1);
            return Double.parseDouble(objectEntry.getValue().toString());
        }
        Map.Entry<String, Object> objectEntry = arrayList.get(9);
        return Double.parseDouble(objectEntry.getValue().toString());
    }

    //获取同时购买I J商品的用户数
    private static Integer getUserIdIJNumber(Integer itemIdI,Integer itemIdJ,HashMap<Integer,String> userIdMap){
        int count=0;
        Set<Integer> keySet = userIdMap.keySet();
        for(Integer key:keySet){
            String itemIds = userIdMap.get(key);
            if(itemIds.contains(itemIdI+"")&&itemIds.contains(itemIdJ+"")){
                count++;
            }
        }
        return count;

    }
}
