# 自动部署Zabbix_agent
> 使用ansible-playbook来自动部署Zabbix的agent端

> Zabbix server端的ip请在zabbix_anget.conf配置文件中自行修改，Beta版暂不提供变量修改Zabbix_server端ip地址

- 使用以下代码执行zabbix_anget自动部署

```bash
git https://github.com/chuxuan909/ansible_zabbix-agent.git
cd roles
ansible-playbook install_zabbix-agent.yml
```

