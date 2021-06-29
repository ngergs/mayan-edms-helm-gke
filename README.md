# Mayan-EDMS Helm chart for GKE

A minimalistic helm chart to setup [mayan edms](https://github.com/mayan-edms/Mayan-EDMS) with a postgresql and redis db. For the dbs the helm charts from [bitnami](https://github.com/bitnami/charts) are used. The persistent volume part is GKE specific.

## Prerequisite
* Both the mayan edms itself and the postgresql need a persistent storage. For this setup two persistent disks that have been initialized and formatted beforehand are required (see volumes.data of the values.yml).
* A k8s secret has to be provided for the given namespace, see the secret.sh shell script (fill the blank password variables and adjust the namespace as required before executing it).