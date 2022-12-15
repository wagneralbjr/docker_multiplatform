create:
	lxc launch ubuntu:jammy my-test --config user.user-data="$$(cat ./my-user-old)"

join_cloud:
	lxc shell my-test

delete_cloud:
	lxc delete my-test --force

tail:
	lxc exec my-test -- tail -f /var/log/cloud-init.log

cat:
	lxc exec my-test -- cat /var/log/cloud-init.log

schema_valid:
	lxc exec my-test -- cloud-init schema --system

status:
	lxc exec my-test -- cloud-init status --wait

get_log:
	lxc exec my-test -- cat /var/log/cloud-init-output.log