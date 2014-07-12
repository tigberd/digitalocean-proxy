name 'my-proxy'

data = Chef::EncryptedDataBagItem.load("apps", "proxy")

default_attributes(
  "proxy" => {
    "pass" => data["pass"]
  }
)

run_list(
  'recipe[proxy]'
)
