# Anomaly detection stack

The stack is intended to be deployed in the AWS, using the [t2.micro][1] instances. It is consisted
of the 3-node Cassandra cluster, and the monitoring node. Each of the Cassandra nodes contains the
following software:

| Software              | Version |
|-----------------------|---------|
| Apache Cassandra      | 2.1.15  |
| cassandra-diagnostics | 1.1.1   |
| Filebeat              | 1.3.1   |

On the other side, monitoring node is equipped with the following tools:

| Software      | Version |
|---------------|---------|
| Elasticsearch | 2.3.4   |
| Logstash      | 2.3.4   |
| Kibana        | 4.5.3   |
| Grafana       | 3.1.1   |
| InfluxDB      | 0.13.0  |
| Riemann       | 0.2.11  |

Note that each of these tools is running inside the Docker container.

## Prerequisites

Before proceeding, make sure that you have the appropriate PEM on your machine. Besides that, you
will also need to export the AWS_ACCESS_KEY and AWS_SECRET_ACCESS_KEY as environment variables.

## Usage

The playbook is intended to be used from the repository root. In case that the infrastructure does
not exist, set the appropriate instance tags (ec2_group variable) and enter the following command:

```
ansible-playbook -i projects/anomaly-detection-stack/inventory --private-key <path to PEM file> projects/anomaly-detection-stack/layers/aws.yml --tags aws-setup
```

To start the cluster, use the following command:

```
ansible-playbook -i projects/anomaly-detection-stack/inventory --private-key <path to PEM file> projects/anomaly-detection-stack/layers/aws.yml --tags aws-start
```

Once you finish using the cluster, make sure you stop it by invoking the playbook as shown in the
snipped below:

```
ansible-playbook -i projects/anomaly-detection-stack/inventory --private-key <path to PEM file> projects/anomaly-detection-stack/layers/aws.yml --tags aws-stop
```

[1]: https://aws.amazon.com/ec2/instance-types/
