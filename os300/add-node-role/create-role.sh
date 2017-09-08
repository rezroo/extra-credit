mkdir roles; cd roles
git init
fuel rel
fuel role --release 2 --role controller --file controller.yaml
git add controller.yaml
git commit -m "fuel role --release 2 --role controller --file controller.yaml"
cp controller.yaml database.yaml
vi controller.yaml database.yaml
fuel role --release 2 --role controller --update --file controller.yaml
fuel role --release 2 --create --file database.yaml
git status

