# furniture
环境配置：
Java1.8
maven3.5.4
tomcat8.5.01
mysql5（mysql8以上需要解决时区配置等问题）
安装说明：
配置好环境后，
设置maven仓库地址：修改maven安装目录下的配置文件（conf文件目录下的setting文件），打开setting，修改本地仓库路径，改为项目中maven仓库（mavenRep文件夹）的路径。
修改furniture\src\main\resources下的db.properties文件中的jdbc连接和密码。
修改furniture\src\main\resources下的db.properties文件中图片库（“my”文件夹）的路径。
运行SQL文件。
