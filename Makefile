.PHONY: jitsi_dir
.PHONY: build_homepage
.PHONY: run_homepage

jitsi_dir:
	mkdir -p jitsi-meet-cfg/{web,transcripts,prosody/config,prosody/prosody-plugins-custom,jicofo,jvb,jigasi,jibri}
	
build_homepage:
	docker build -f homepage/Dockerfile -t openteams-homepage .

run_homepage:
	docker run -d --name openteams-homepage --network openteams_openteams-network openteams-homepage

