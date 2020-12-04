# sbt-base

Simple base image to use for CodeReadyWorkspace Apps. Since the Eclipse Che Scala Devfile example came with a project that had a custom sbt wrapper script this base image already has sbt installed and ready to go. Simple create the image for the docker file (or use dbrletic/sbt-base:1.4.1 from Dockerhub) with the scala-sbt devfile

If using the Eclipse Che scala-sbt devfile and this sbt-base image make sure to remove the SBT_OPTS, JAVA_OPTS, and JAVA_TOOL_OPTIONS env variables. 
