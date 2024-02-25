# build
npm run build

# copy jekyll config
Copy-Item .\_config.yml -Destination .\dist\_config.yml

# navigate into the build output directory
cd dist

# if you are deploying to a custom domain
# echo 'www.example.com' > CNAME

git init
git add -A
git commit -m 'deploy'


# if you are deploying to https://<USERNAME>.github.io/<REPO>
git push -f git@github.com:peczwy/GospelAccordingToSQLServer.git master:gh-pages

cd ..