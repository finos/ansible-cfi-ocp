# Finos Ansible guidelines

## The Finos Ansible namespace

In order to sensibly manage Finos content. I propose putting all Ansible content under the `finos.x` namespace.

For anyone unfamiliar with namespaces, Ansible allows us to organise collections and roles under a namespace.

    namespace.collection.roles

The namespace just allows us to organise a related set of content in a group on a particular system. It's not got a folder structure, it is just a setting in the collection. When Ansible installs the collection, it is able to logically group the collections together for easier reference.

For our Finos project, the namespace would be

    finos.collection.role

We can then create collections underneat 

To find out more about namespaces, I highly recommend reading [this page on Galaxy namespaces](https://galaxy.ansible.com/docs/contributing/namespaces.html).

For example, the OCP deployment collection `ocp_deployment` would become `finos.ocp_deployment` when fully qualified.

## Deployment roles

These will be the primary deployment roles for deploying OCP onto each platform. They are responsible _only_ for deployment. They will not perform any hardening.

    finos.ocp_deployment.gcp_deploy
    finos.ocp_deployment.azure_deploy
    finos.ocp_deployment.aws_deploy

## Hardening roles

    finos.ocp_deployment.gcp_secure
    finos.ocp_deployment.azure_secure
    finos.ocp_deployment.aws_secure

## Role default variables

When using roles, we want to have a standard set of role variables that we can override in order to influence the behaviour of a specific role.

### Deployment role variables
As each deployment role for OCP will need different variables (GCP needs project information, AWS needs a VPC or Organisation).

To help end users, within the role we should define a safe set of defaults to be used in the role defaults file. 

Good reasons for doing this are that 
* A safe set of defaults for users unfamiliar with the role
* Role defaults have the lowest order of precedence, so can be overridden in a multitude of levels.

The role defaults file can be found here.

    role/defaults/main.yml

#### Google Cloud Platform

# OCP GCP Structure

## Variables

```
# The fully qualified DNS name of the cluster
dns_fqdn

# The amount of required storage in GB
storage_GB

# The number of firewall rules available
firewall_rules > 15

# The number of compute CPUs required
compute_cpu

# The environment which we are deploying 
enviroment = [Test, Prod]

# The minimum number of forwarding rules 
forwarding_rules >= 2 

# The visibility of the cluster
visibility = [Public, Private]

# The minimum number of public IP addresses
public_ip_num >= 3

# The minimum number of VPCs 
vpc_num = 1

# The minimum number of VPC Networks
vpc_ networks >= 2

# The minimum number of VPC routers
vpc_routers >= 1

# The minimum number of VPC routes
vpc_routes >= 2

# The minimum number of VPC subnets
vpc_subnets >= 2

# The pull secret 
pull_secret = ""

# An optional ssh key to access the hosts
ocp_ssh_key = "" (optional)
```
