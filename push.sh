hugo --theme=LoveIt --baseUrl="https://lusenzhang.github.io/" --buildDrafts
cd public
git init
git add .
git commit -m "new submit"
git remote add origin https://github.com/LusenZhang/lusenzhang.github.io.git
git push -u origin master
