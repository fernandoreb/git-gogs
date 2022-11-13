# Gogs - Sample Git Server

This project is a Sample Git Server using Gogs to be used on Openshift. 

It is based on: https://github.com/OpenShiftDemos/gogs-openshift-docker

**Caution. It should not be used in a productive environment**

It is recommended to use only for testing.

Learn more about it at https://gogs.io/

## Build Image

```
podman build . -t quay.io/fernandoreb/gogs:x.y.z
```

```
podman push quay.io/fernandoreb/gogs:x.y.z
```

## Deployment

There is an environment provisioning template available

```
oc new-app -f openshift/gogs-persistent-template.yaml --param=HOSTNAME=gogs-demo.yourdomain.com
```

Note that hostname is required during Gogs installation in order to configure repository urls correctly.

## Gogs Image Versions

The template use the param: ```GOGS_VERSION``` to be select the version of image and you will be change using like:
```
oc new-app -f openshift/gogs-persistent-template.yaml --param=HOSTNAME=gogs-demo.yourdomain.com --param=GOGS_VERSION=0.11.4
```

# Gogs Admin User
After Gogs deployment, the first registered user will be admin. The default administrator can log into Admin > Users and authorize another user. A user will also be an > administrator if they register in the install page. Read more on [Gogs FAQ](https://gogs.io/docs/intro/faqs#administration)
