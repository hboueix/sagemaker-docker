# Conda Envs as Kernels for SageMaker

Source: https://github.com/aws-samples/sagemaker-studio-custom-image-samples/tree/main/examples/conda-env-kernel-image  
  
## Usage

Edit `environment.yml` as needed, modify `REPOSITORY` and `IMAGE_NAME` variables in `01_build_image.sh`, then run it:
```bash
# Don't specify `push` if you don't want to push to ECR
./01_build_image.sh push
```
  
Again edit `REPOSITORY` and `IMAGE_NAME` variables in `02_create_SMI.sh` this time and run it:
```bash
./02_create_SMI.sh
```  
  
Create a json input from example `inputs/app-image-config-input.example.json`, modify `JSON_INPUT` variable in `03_create_AppImageConfig.sh` if needed and run it:
```bash
./03_create_AppImageConfig.sh
```  
  
Finally, if you want to create a new domain with this image attached on it:  
  
- After creating a json input from example `inputs/create-domain-input.example.json`, modifying `CREATE_INPUT` variable in `04_domain.sh` if needed:
```bash
./04_domain.sh create
```  
  

Or if you want to update an existing domain to attach this image on it:  
  
- After creating a json input from example `inputs/update-domain-input.example.json`, modifying `UPDATE_INPUT` variable in `04_domain.sh` if needed:
```bash
./04_domain.sh update
```  
  
