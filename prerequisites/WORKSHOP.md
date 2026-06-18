# 🛑 Prerequisites - Workshop

> [!IMPORTANT]  
> **Not at an in-person workshop or having issues?**  
> [Continue to individual prerequisites](./INDIVIDUAL.md)

## Pull Docker images from local mirror

Pull the images:

```shell
docker pull registry.labs.dae.mn/aws-cli:latest
```

<!--  -->

```shell
docker pull registry.labs.dae.mn/terraform:1.15
```

Retag to original names for use in docker-compose:

```shell
docker tag registry.labs.dae.mn/aws-cli:latest amazon/aws-cli:latest
docker tag registry.labs.dae.mn/terraform:1.15 hashicorp/terraform:1.15
```

> [!IMPORTANT]  
> Once you've finished, [continue with the workshop](../README.md#running-locally).  
> If you're having issues, [try the individual prerequisites](./INDIVIDUAL.md).
