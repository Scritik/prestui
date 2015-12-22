## PrestUI: RiotJS-based UI library for PrestaShop

PrestUI is an UI library to support the developement of PrestaShop modules. It allows you to write one concise html, compatible with all recent versions of PrestaShop (1.5 and 1.6). PrestUI will automatically adapt depending on which PrestaShop version the module is used on.

It allows you to write:

```html
<ps-switch name="switch" label="Switch" yes="Yes" no="No" active="true"></ps-switch>
```

And you will get something like this, a valid HTML for PrestaShop:

```html
<div class="form-group">
	<label class="control-label col-lg-3 "><span>Switch</span></label>
	<div class="col-lg-9">
		<span class="switch prestashop-switch fixed-width-lg">
			<input type="radio" value="1" name="switch" id="switch_on" checked="checked">
			<label for="switch_on">Yes</label>
			<input type="radio" value="0" name="switch" id="switch_off">
			<label for="switch_off">No</label>
			<a class="slide-button btn"></a>
		</span>
	</div>
</div>
```

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
$this->smarty->assign('tags', array('tabs', 'panel'));
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
