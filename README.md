# Gogs - Sample Git Server

This project is a Sample Git Server using Gogs to be used on Openshift and you use when you don't have a git server avaiable. We can use to demostrate a CI/CD flow, a development flow, for example.


It is based on: https://github.com/OpenShiftDemos/gogs-openshift-docker

**Caution. It should not be used in a productive environment**

It is recommended to use only for testing.

Learn more about it at https://gogs.io/

## Create a namespace

```
oc new-project git
```

## Checkou this project

We are using S2I from local dir.

## Build Image - using S2I

```
oc new-build --binary --strategy=docker --name git-gogs
```

```
oc start-build git-gogs --from-dir . -F
```

## Deployment

There is an environment provisioning template available

```
oc new-app -f openshift/gogs-persistent-template.yaml --param=HOSTNAME=gogs-demo-git.<REPLACE-WILDCARD> --param=NAMESPACE_IMAGE=git
```

Note that hostname is required during Gogs installation in order to configure repository urls correctly.


# Gogs Admin User
After Gogs deployment, the first registered user will be admin.   
The default administrator can log into Admin > Users and authorize another user.   
A user will also be an > administrator if they register in the install page. Read more on [Gogs FAQ](https://gogs.io/docs/intro/faqs#administration)

