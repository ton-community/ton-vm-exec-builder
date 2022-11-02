docker run --rm -v $(pwd)/output:/output $(docker build -q -f builder/Dockerfile .)
echo check the output folder if there were no errors indicated above
