# 自动部署Zabbix_agent
> 使用ansible-playbook来自动部署Zabbix的agent端

> Zabbix server端的ip请在zabbix_anget.conf配置文件中自行修改，Beta版暂不提供变量修改Zabbix_server端ip地址

- 1.确保你已经安装了ansible

- 2.确保你已经设置好了远程被管理主机

> 配置文件~/hosts

- 3.使用以下代码执行zabbix_anget自动部署

> 修改install_zabbix-agent.yml文件内的hosts模块后的参数为你定义好的远程host主机地址

```bash
git clone https://github.com/chuxuan909/ansible_zabbix-agent.git
cd ansible_zabbix-agent
ansible-playbook install_zabbix-agent.yml
```

