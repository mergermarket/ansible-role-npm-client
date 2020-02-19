import os

import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']
).get_hosts('all')


def test_build_npm_config_cron_exists(host):
    f = host.file('/etc/cron.d/build-npm-config')
    assert f.exists
