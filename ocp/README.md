# OpenShift Compliant Financial Infrastructure Introduction

OpenShift (OCP) is an open hybrid cloud enterprise Kubernetes platform that can be installed on a number of cloud providers including Amazon Web Services (AWS), Azure and Google Cloud Platform (GCP).

This section provides an opinionated approach, documentation and working code to implement CFI security policies laid out in the [OpenShift Security Configuration (Service Accelerator)](ServiceApprovalAccelerator_OCP.md).


The initial focus of the project team is to implement the Service Accelerator policies on OpenShift 4.11 running on [Google Cloud Platform](./gcp/), in the future this will be expanded to futher automation and include other cloud providers that OCP supports. 

For each cloud provider documentation and working code will be provided to:

1. Cloud provider setup and Cluster Installation
2. Identity provider configuration
3. Setup default network policies
4. Updating the self signed certificates for the API Server and Router
5. Implement OCP Compliance Operator
6. Manual Remediation of CIS Controls

Using the above will provide an OCP Cluster which is compliant with most CIS and PCI-DSS Policies. There are a number of CIS and PCI-DSS policies that require a user to make local decisions on how the policy would be implemented, these are describe these as MANUAL. 

We do provide examples of how some of these types of policies could implemented, for example adding an identity provider or replacing the self signed certificates.

In step 6 we have provided some guidance and examples on how to remediation some of the CIS controla. 

Below is a list of the CIS and PCI-DSS policies that a user will have to investigate and decide how they should be implemented within their own organisation. 

```console

NAME                                                STATUS   SEVERITY
ocp4-cis-audit-log-forwarding-enabled               FAIL     medium
ocp4-cis-accounts-restrict-service-account-tokens   MANUAL   medium
ocp4-cis-accounts-unique-service-account            MANUAL   medium
ocp4-cis-api-server-oauth-https-serving-cert        MANUAL   medium
ocp4-cis-api-server-openshift-https-serving-cert    MANUAL   medium
ocp4-cis-general-apply-scc                          MANUAL   medium
ocp4-cis-general-configure-imagepolicywebhook       MANUAL   medium
ocp4-cis-general-default-namespace-use              MANUAL   medium
ocp4-cis-general-default-seccomp-profile            MANUAL   medium
ocp4-cis-general-namespaces-in-use                  MANUAL   medium
ocp4-cis-rbac-limit-cluster-admin                   MANUAL   medium
ocp4-cis-rbac-limit-secrets-access                  MANUAL   medium
ocp4-cis-rbac-pod-creation-access                   MANUAL   medium
ocp4-cis-rbac-wildcard-use                          MANUAL   medium
ocp4-cis-scc-drop-container-capabilities            MANUAL   medium
ocp4-cis-scc-limit-ipc-namespace                    MANUAL   medium
ocp4-cis-scc-limit-net-raw-capability               MANUAL   medium
ocp4-cis-scc-limit-network-namespace                MANUAL   medium
ocp4-cis-scc-limit-privilege-escalation             MANUAL   medium
ocp4-cis-scc-limit-privileged-containers            MANUAL   medium
ocp4-cis-scc-limit-process-id-namespace             MANUAL   medium
ocp4-cis-scc-limit-root-containers                  MANUAL   medium
ocp4-cis-secrets-consider-external-storage          MANUAL   medium
ocp4-cis-secrets-no-environment-variables           MANUAL   medium

```

```console

NAME                                                                STATUS   SEVERITY
ocp4-pci-dss-accounts-restrict-service-account-tokens                MANUAL   medium
ocp4-pci-dss-accounts-unique-service-account                         MANUAL   medium
ocp4-pci-dss-file-groupowner-proxy-kubeconfig                        MANUAL   medium
ocp4-pci-dss-file-owner-proxy-kubeconfig                             MANUAL   medium
ocp4-pci-dss-general-apply-scc                                       MANUAL   medium
ocp4-pci-dss-general-configure-imagepolicywebhook                    MANUAL   medium
ocp4-pci-dss-general-default-namespace-use                           MANUAL   medium
ocp4-pci-dss-general-default-seccomp-profile                         MANUAL   medium
ocp4-pci-dss-general-namespaces-in-use                               MANUAL   medium
ocp4-pci-dss-rbac-limit-cluster-admin                                MANUAL   medium
ocp4-pci-dss-rbac-limit-secrets-access                               MANUAL   medium
ocp4-pci-dss-rbac-pod-creation-access                                MANUAL   medium
ocp4-pci-dss-rbac-wildcard-use                                       MANUAL   medium
ocp4-pci-dss-scc-drop-container-capabilities                         MANUAL   medium
ocp4-pci-dss-scc-limit-ipc-namespace                                 MANUAL   medium
ocp4-pci-dss-scc-limit-net-raw-capability                            MANUAL   medium
ocp4-pci-dss-scc-limit-network-namespace                             MANUAL   medium
ocp4-pci-dss-scc-limit-privilege-escalation                          MANUAL   medium
ocp4-pci-dss-scc-limit-privileged-containers                         MANUAL   medium
ocp4-pci-dss-scc-limit-process-id-namespace                          MANUAL   medium
ocp4-pci-dss-scc-limit-root-containers                               MANUAL   medium
ocp4-pci-dss-secrets-consider-external-storage                       MANUAL   medium
ocp4-pci-dss-secrets-no-environment-variables                        MANUAL   medium
ocp4-pci-dss-audit-log-forwarding-enabled                            FAIL     medium
ocp4-pci-dss-configure-network-policies-namespaces                   FAIL     high
ocp4-pci-dss-file-integrity-exists                                   FAIL     medium
ocp4-pci-dss-file-integrity-notification-enabled                     FAIL     medium
ocp4-pci-dss-idp-is-configured                                       FAIL     medium
ocp4-pci-dss-kubeadmin-removed                                       FAIL     medium
ocp4-pci-dss-node-master-partition-for-var-log-kube-apiserver        MANUAL   medium
ocp4-pci-dss-node-master-partition-for-var-log-oauth-apiserver       MANUAL   medium
ocp4-pci-dss-node-master-partition-for-var-log-openshift-apiserver   MANUAL   medium
ocp4-pci-dss-node-worker-partition-for-var-log-kube-apiserver        MANUAL   medium
ocp4-pci-dss-node-worker-partition-for-var-log-oauth-apiserver       MANUAL   medium
ocp4-pci-dss-node-worker-partition-for-var-log-openshift-apiserver   MANUAL   medium

```