## PrestUI: RiotJS-based UI library for PrestaShop

PrestUI is an UI library to support the developement of PrestaShop modules. It allows you to write one concise html, compatible with all major versions of PrestaShop (1.5 and 1.6, 1.4 in the next release). PrestUI will automatically adapt depending on which PrestaShop version the module is used on.

PrestUI is based on RiotJS, a really light React-like user interface library.
You can find more information about RiotJS on [GitHub](https://github.com/muut/riotjs) and a full documentation on the [official website](https://muut.com/riotjs/).

## Installation / Usage

To use PrestUI, you need to include the files into your module. Download PrestUI and move the folder in `/views/templates/admin/`

You also need to include RiotJS since all the components are based on it.
You can [download a copy](https://muut.com/riotjs/download.html) and include it into the module, or you can use a CDN like this:

``` php
$this->context->controller->addJS('https://cdn.jsdelivr.net/g/riot@2.0(riot.min.js+compiler.min.js)');
```

You can now include PrestUI like this:

``` php
return $html.$this->display(__FILE__, 'views/templates/admin/prestui/ps-tags.tpl');
```

If you only need a few tags, you can assign a variable with only the groups you need, before rendering ps-tags:

``` php
$this->smarty->assign('ps_version', array('tabs', 'panel'));
```

## Available tags

All available tags and their attributes are listed on the [wiki](../../wiki)

## Roadmap

- 0.1 (Released)
	- Tags loader
	- Basic inputs
	- Panel
	- Tabs
- 0.2 (Released)
	- PS 1.4 compatibility
	- More inputs
	- alerts
- 0.3
	- Lists
	- Required inputs
	- Remove 1.4 compatibility

## Contribution

Found a bug or have an idea? Use GitHub's tickets system. You can also make a pull request.

## License

PrestUI is licensed under the [MIT licence](http://opensource.org/licenses/MIT)
