# Mayan-EDMS Helm chart for GKE

A minimalistic helm chart to setup [mayan edms](https://github.com/mayan-edms/Mayan-EDMS) with a postgresql and redis db. For the dbs the helm charts from [bitnami](https://github.com/bitnami/charts) are used. The persistent volume part is GKE specific.

## Prerequisite
* Both the mayan edms itself and the postgresql need a persistent storage. For this setup two persistent disks that have been initialized and formatted beforehand are required (see volumes.data of the values.yml). Creation works e.g. via 
    ```
    gcloud beta compute disks create mayan-data --project={{your project}} --type=pd-standard --size=100GB --zone=europe-west3-a
    gcloud beta compute disks create mayan-postgresql --project={{your project}} --type=pd-standard --size=10GB --zone=europe-west3-a
    ```
    Then create a temporary VPC instance and format the disk as described in the [google docs](https://cloud.google.com/compute/docs/disks/add-persistent-disk).
