echo 'Create project'
gcloud projects create smartworkx-test
echo 'Link billing account'
gcloud alpha billing projects link smartworkx-test --billing-account 0161DA-EC0DFD-D570EC
echo 'Enable services'
gcloud services enable compute.googleapis.com --project smartworkx-test
gcloud services enable container.googleapis.com --project smartworkx-test
echo 'Create terraform account'
gcloud iam service-accounts create terraform
gcloud iam service-accounts keys create ./key.json --iam-account terraform@smartworkx-test.iam.gserviceaccount.com
gcloud projects add-iam-policy-binding smartworkx-test --member serviceAccount:terraform@smartworkx-test.iam.gserviceaccount.com --role roles/compute.viewer
gcloud projects add-iam-policy-binding smartworkx-test --member serviceAccount:terraform@smartworkx-test.iam.gserviceaccount.com --role roles/container.clusterAdmin
gcloud projects add-iam-policy-binding smartworkx-test --member serviceAccount:terraform@smartworkx-test.iam.gserviceaccount.com --role roles/container.developer
gcloud projects add-iam-policy-binding smartworkx-test --member serviceAccount:terraform@smartworkx-test.iam.gserviceaccount.com --role roles/iam.serviceAccountAdmin
gcloud projects add-iam-policy-binding smartworkx-test --member serviceAccount:terraform@smartworkx-test.iam.gserviceaccount.com --role roles/iam.serviceAccountUser
gcloud projects add-iam-policy-binding smartworkx-test --member serviceAccount:terraform@smartworkx-test.iam.gserviceaccount.com --role roles/resourcemanager.projectIamAdmin
echo 'Setup networking'
gcloud compute networks subnets update default --region europe-west4 --add-secondary-ranges default-01-gke-01-pods=10.0.2.0/24,default-01-gke-01-services=10.0.1.0/24
