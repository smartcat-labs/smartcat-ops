# Sentinel

Sentinel is an application used for triggering alerts about the monitored system, based on various
metrics emitted by the system itself. It is built on top of the [Apache Spark][www-spark].

## About
Sentinel stack is intended to be deployed in the AWS, using the EC2 instances. The stack is
consisted of the 3-node Cassandra cluster, monitoring node, load generator node, and the 3-node
analytic cluster.

### Cassandra

| Software              | Version |
|-----------------------|---------|
| Apache Cassandra      | 3.0.8   |
| cassandra-diagnostics | 1.2.2   |
| Filebeat              | 1.3.1   |

### Monitoring
Monitoring node consists of multiple tools for storing and displaying various metrics, each of them
deployed as a Docker container.

| Software      | Version |
|---------------|---------|
| Elasticsearch | 2.3.4   |
| Logstash      | 2.3.4   |
| Kibana        | 4.5.3   |
| Grafana       | 3.1.1   |
| InfluxDB      | 0.13.0  |
| Riemann       | 0.2.11  |

## Prerequisites
Before proceeding, make sure that you have the appropriate PEM on your machine. Besides that, you
will also need to export the AWS_ACCESS_KEY and AWS_SECRET_ACCESS_KEY as environment variables.

## Usage
The playbook is intended to be used from the repository root. In case that the infrastructure does
not exist, set the appropriate instance tags (ec2_group variable) and enter the following command:

```
ansible-playbook -i projects/sentinel/inventory --private-key <path to PEM file> projects/sentinel/layers/all.yml --tags aws-setup
```

To start the cluster, use the following command:

```
ansible-playbook -i projects/sentinel/inventory --private-key <path to PEM file> projects/sentinel/layers/all.yml --tags aws-start
```

Once you finish using the cluster, make sure you stop it by invoking the playbook as shown in the
snipped below:

```
ansible-playbook -i projects/sentinel/inventory --private-key <path to PEM file> projects/sentinel/layers/all.yml --tags aws-stop
```

Alternatively, if you want to terminate the cluster, you can do it by providing the `aws-terminate`
tag:

```
ansible-playbook -i projects/sentinel/inventory --private-key <path to PEM file> projects/sentinel/layers/all.yml --tags aws-terminate
```

[www-spark]: http://spark.apache.org
