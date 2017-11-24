# DSE

This project will install DSE Search 5.1 on Ubuntu 14.03.

Vagrant image runs on 192.168.88.88

# Installation

Pass your `dsa_email_addres` and `dsa_password` as extra arguments while running the playbook.

`ansible-playbook -i projects/dse/inventory/local projects/dse/layers/search.yml --extra-vars "dsa_email_address=[your_datastax_academy_accound] dsa_password=[your_datastax_academy_password]"`

# Docs

Check [DataStax Search docs](https://docs.datastax.com/en/dse/5.1/dse-admin/datastax_enterprise/search/searchTOC.html) for more info on setting up and managing Solr cores.
