#!/bin/bash
# Script to trigger rescan
oc annotate compliancescans/ocp4-cis compliance.openshift.io/rescan=
oc annotate compliancescans/ocp4-cis-node-master compliance.openshift.io/rescan=
oc annotate compliancescans/ocp4-cis-node-worker compliance.openshift.io/rescan=
oc annotate compliancescans/ocp4-pci-dss compliance.openshift.io/rescan=
oc annotate compliancescans/ocp4-pci-dss-node-master compliance.openshift.io/rescan=
oc annotate compliancescans/ocp4-pci-dss-node-worker compliance.openshift.io/rescan=