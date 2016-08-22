# Monitoring

This project provides Ansible scripts for provisioning a metrics monitoring server based on [Riemann](http://riemann.io/), [InfluxDB](https://influxdata.com/) and [Grafana](http://grafana.org/).

It installs [ELK stack](https://www.elastic.co/products) as well as central log storage and adds ElasticSearch as data source to Grafana.

Additional required Ansible roles can be installed using `requirements.yml`:

```
ansible-galaxy install -r projects/monitor/requirements.yml
```

