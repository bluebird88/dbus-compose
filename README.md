#### dbus docker-compose script
----
##### refer：
- https://bridata.github.io/DBus/deploy.html
- 
-------------
##### 规划
- 节点：采用dbus-nx命令，但是借助docker的引用实现
```
192.168.0.1 dbus-n1
192.168.0.2 dbus-n2
192.168.0.3 dbus-n3
```
- 基于上述部署方案，image规划如下：
1. dbus_base_image:
    + zookeeper/storm/kafka
    + kafka-manager
2. tools_manage_image:
    + storm nimbus/ui
    + zookeeper ui(zkui)
3. dbus_image:
    + dbus keeper/dbus heartbeat

- 部署
```
zookeeper：     推荐部署dbus-n1、dbus-n2、dbus-n3。
Storm：         推荐部署dbus-n1、dbus-n2、dbus-n3。
Storm Nimbus：  推荐部署dbus-n1。
Storm UI：      推荐部署dbus-n1。
Kafka：         推荐部署dbus-n1、dbus-n2、dbus-n3。
DBUS Keeper：   推荐部署dbus-n3（若部署集群，可部署到dbus-n2、dbus-n3）。
DBUS HeartBeat：推荐部署dbus-n2、dbus-n3。
```

##### 软件依赖

名称	版本号	说明
```
Canal	v1.0.22	DBus用于实时抽取binlog日志。DBus修改一个文件, 具体配置可参考canal相关支持说明，支持mysql5.6，5.7
Zookeeper	v3.4.6+	用于构建整个系统和提供配置通知等。推荐版本：v3.4.8
Kafka	v0.10	用于存储相关数据和消息，提供订阅和发布的能力
Storm	v1.0.2	用于提供DBus流式计算
Influxdb	v1.1.0	用于记录实时监控数据。创建好账号。后续配置需提供。
Grafana	v4.2.0	用于展示监控信息。
MySql	v5.6.x	创建数据库dbusmgr。创建好账号。后续配置需提供。
Nginx	v1.9.3	用于存放静态html、js文件及反向代理。
kafka-manager	v1.3.3.4	选装。用于便捷地查看、管理Kafka集群。建议安装。
```
