## PrestUI: UI library for PrestaShop modules

PrestUI is an UI library to help you develop interfaces for your PrestaShop modules. It allows you to write one concise html, compatible with all recent versions of PrestaShop (1.5, 1.6 and 1.7). PrestUI will automatically adapt depending on which PrestaShop version the module is used on.

Eg, you can write:

```html
<ps-switch name="switch" label="Switch" yes="Yes" no="No" active="true"></ps-switch>
```

And you will automatically get something like this, a valid HTML for PrestaShop (1.6+ here):

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

To use PrestUI, you need to include the files into your module. [Download PrestUI](../../releases) and move the folder in `/views/templates/admin/`

You also need to include RiotJS+compiler since all the components are based on it.
You can [download a copy](http://riotjs.com/download/) and include it into the module, or you can [use a CDN](http://riotjs.com/download/).

You can now include PrestUI and RiotJS like this:

``` php

$this->context->controller->addJS('path/to/riot+compiler.js')

$html = $this->display(__FILE__, 'path/to/your/file.tpl')

return $html.$this->display(__FILE__, 'views/templates/admin/prestui/ps-tags.tpl');
```

If you only need a few tags, you can assign a variable with only the groups you need, before rendering ps-tags:

``` php
$this->smarty->assign('tags', array('tabs', 'panel'));
```

## Available tags

All available tags and their attributes are listed on the [wiki](../../wiki)

## Contribution

Found a bug or have an idea? Use GitHub's tickets system.
If you want to help and add a feature or fix a bug, you need to make a pull request:

- Create a fork of this repo
- Create a new branch like "feature-xxxxxx"
- Commit your changes on the dev branch
- Create your pull request on GitHub

## License

PrestUI is licensed under the [MIT licence](http://opensource.org/licenses/MIT)
