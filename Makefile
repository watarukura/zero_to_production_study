setup:
	cp /vscode/scripts/path.fish ~/.config/fish/conf.d/
	aqua install
	sqlx database create
	sqlx migrate run