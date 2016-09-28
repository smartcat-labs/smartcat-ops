# Anomaly detection stack

The stack is intended to be deployed in the AWS, using the [t2.micro][1] instances. It is consisted
of the 3-node Cassandra cluster, and the monitoring node. Each of the Cassandra nodes contains the
following software:

| Software              | Version |
|-----------------------|---------|
| Apache Cassandra      | 3.0.8   |
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

The playbook should be executed from the repository root, using the following command:

```
ansible-playbook -i projects/anomaly-detection-stack/inventory --private-key <path to PEM file> projects/anomaly-detection-stack/layers/aws.yml
```

Once started, it will create new EC2 instances and provision each of them. In case that you do not
want to create instances, but only to provision the existing ones, use the `--skip-tags "aws_setup"`
attribute:

```
ansible-playbook -i projects/anomaly-detection-stack/inventory --private-key <path to PEM file> projects/anomaly-detection-stack/layers/aws.yml --skip-tags "aws_setup"
```

[1]: https://aws.amazon.com/ec2/instance-types/
