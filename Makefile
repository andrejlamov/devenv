build: dotfiles
	docker build -t devenv .

dotfiles:
	git clone https://github.com/andrejlamov/dotfiles.git
run:
	docker run --rm --memory-swap -1 \
	-v `readlink -f ~/code`:/root/code \
	-v `readlink -f dotfiles`:/root/dotfiles \
	-v `readlink -f ~/.ivy2`:/root/.ivy2 \
	-v `readlink -f dotfiles/.sbt`:/root/.sbt \
	-v `readlink -f ~/.coursier`:/root/.coursier \
	-i -t devenv
