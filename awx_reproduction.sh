
tower-cli organization create --name=Default

tower-cli credential create --name="bug2226" --credential-type="Vault" --organization=Default --inputs="vault_password: foobar"
tower-cli project create --name="bug2226" --organization=Default --scm-type=git --scm-url="https://github.com/aldobongio/awx-bug-2226.git" --wait
tower-cli inventory create --name="bug2226" --organization=Default
tower-cli inventory_source create --name="bug2226" --inventory=bug2226 --source-project=bug2226 --source=scm --source-path="bug2226/inventory.yml" --update-on-project-update=true

tower-cli job_template create --name="bug2226" --project=bug2226 --inventory=bug2226 --vault-credential=bug2226 --playbook="bug2226/playbooks/bug.yml"
tower-cli job launch -J bug2226 --monitor
