create-snapshot:
	docker exec -it directus-app npx directus schema snapshot /directus/snapshots/current.yml
create-backup-snapshot:
	docker exec -it directus-app npx directus schema snapshot /directus/snapshots/$(shell date +%F)_snapshot_$(shell date +%s).yml
