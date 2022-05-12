// depedencies
let yamlLint = require('yaml-lint');
let fs = require('fs')

// check spring boot yaml
let filename = ".github\\workflows\\azure-spring-cloud-java-spring-boot.yml"
let content = fs.readFileSync(process.cwd() + "/" + filename).toString()

yamlLint
  .lint(content)
  .then(() => {
    console.log('Valid YAML file.');
    return 0;
  })
  .catch((error) => {
    console.error('Invalid YAML file.', error);
    return -1;
  });