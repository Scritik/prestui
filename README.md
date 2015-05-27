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
$this->smarty->assign('ps_version', Tools::substr(_PS_VERSION_, 0, 3));
return $html.$this->display(__FILE__, 'views/templates/admin/prestui/ps-tags.tpl');
```

If you only need a few tags, you can assign a variable with only the groups you need, before rendering ps-tags:

``` php
$this->smarty->assign('ps_version', array('tabs', 'panel'));
```

The component's groups available are : `tabs`, `panel` and `form`

## Tags

All tags available in PrestUI with details attributes

### Tabs

``` html
<ps-tabs>

	<ps-tab-nav>
		<li riot-tag="ps-tab-nav-item" target="tab1" class="active">Tab 1</li>
		<li riot-tag="ps-tab-nav-item" target="tab2">Tab 2</li>
	</ps-tab-nav>

	<ps-tab-content>
		<div id="tab1" class="tab-pane active">
			Content 1
		</div>
		<div id="tab2" class="tab-pane">
			Content 2
		</div>
	</ps-tab-content>

</ps-tabs>
```
####`<li riot-tag="ps-tab-nav-item">`

Content of this tag is the tab's name

attribute|optional|value|comment
---------|--------|-----|-------
class|yes|active|Add this attribute to choose the active tab
target|no|tab-content's id|

### Alerts

``` html
<ps-alert-success>Saved with success!</ps-alert-success>

<ps-alert-error>Oops, something went wrong!</ps-alert-error>

<ps-alert-hint>Remember to save after any modification</ps-alert-hint>

<ps-alert-warn>You need to update!</ps-alert-warn>
```

### Panel

Content of this tag is the panel's content

``` html
<ps-panel icon="icon-cogs" img="../img/t/AdminBackup.gif" header="My panel">

	<ps-panel-footer>
		<ps-panel-footer-submit title="save" icon="save" direction="right" name="submitPanel"></ps-panel-footer-submit>
		<ps-panel-footer-link title="Back to Google" icon="back" href="http://google.fr" direction="left">
	</ps-panel-footer>

</ps-panel>
```

####`<ps-panel>`

attribute|optional|value|comment
---------|--------|-----|-------
icon|yes|icon's name|Only for PS 1.6
img|yes|icon's path|Path. Only for PS 1.5 and 1.4
header|yes|text|Panel's title. HTML allowed.

####`<ps-panel-footer-submit>` and `<ps-panel-footer-link>`

attribute|optional|value|comment
---------|--------|-----|-------
label|no|text|
name|no|text|
title|no|text|Button's label
direction|no|right / left|Button's position
icon|no|icon's name|Only for PS 1.6
img|no|icon's path|Only for PS 1.5 and 1.4

### Form

Remember to wrap your inputs into a `<form class="form-horizontal">` on PS 1.6

``` html
<ps-input-text name="ps_input" label="Text input" help="Need some help?" size="10" value="PrestaShop rocks" required="true" suffix="suffix" prefix="prefix" hint="That's right baby" fixed-width="lg"></ps-input-text>

<ps-form-group name="my_select" label="Select">
	<select name="my_select">
		<option value="presta">Presta</option>
		<option value="shop">Shop</option>
	</select>
</ps-form-group>

<ps-switch name="switch" label="Switch" yes="Yes" no="No" active="true"></ps-switch>

<ps-radios label="Radios">
	<ps-radio name="ps_radio" value="1">Yes</ps-radio>
	<ps-radio name="ps_radio" value="0" checked="true">No</ps-radio>
</ps-radios>

<ps-checkboxes label="Checkboxes">
	<ps-checkbox name="versions[]" value="1.4">1.4</ps-checkbox>
	<ps-checkbox name="versions[]" value="1.5" checked="true">1.5</ps-checkbox>
	<ps-checkbox name="versions[]" value="1.6">1.6</ps-checkbox>
</ps-checkboxes>

<ps-color-picker label="Color" name="color_picker"></ps-color-picker>

<ps-date-picker id="date_picker" name="date_picker" label="My datepicker" value="03/05/2015"></ps-date-picker>

<ps-password label="Your password"></ps-password>
```

####`<ps-form-group>`, `<ps-radios>`, `<ps-checkboxes>` and all the form tags (except `ps-radio` and `ps-checkbox`) include the following attributes:

attribute|optional|value|comment
---------|--------|-----|-------
label|no|text|
help|yes|text|Some help under the field
hint|yes|text|Hidden help inside label's text
required|yes|true|Mark a field as required

You can use `<ps-form-group>` to wrap form fields, a select for exemple.

####`<ps-input-text>`

attribute|optional|value|comment
---------|--------|-----|-------
name|no|text|
size|yes|int|Input's size for PS 1.5/1.4
fixed-width|yes|xs / sm / md / lg / xl / xxl
prefix|yes|text|
suffix|yes|text|

####`<ps-switch>`

attribute|optional|value|comment
---------|--------|-----|-------
name|no|text|
yes|no|text|Label for the active state
no|no|text|Label for the deactive state
active|yes|true / false|Switch's state

####`<ps-radio>`

attribute|optional|value|comment
---------|--------|-----|-------
name|no|text|
value|no|text|
checked|yes|true / false|radio's state
content|no|radio's label

####`<ps-checkbox>`

attribute|optional|value|comment
---------|--------|-----|-------
name|no|text|
value|no|text|
checked|yes|true / false|checkbox's state
content|no|checkbox's label

####`<ps-color-picker>`

attribute|optional|value|comment
---------|--------|-----|-------
name|no|text
value|no|text|HEX default color. Default: #000000
size|yes|int|Default: 20
fixed-width|yes|xs / sm / md / lg / xl / xxl

####`<ps-date-picker>`

Add the following code in your module to make sure jQuery UI is loaded:

```
if (_PS_VERSION_ < '1.5')
	includeDatepicker('');
else
	$this->context->controller->addJqueryUI('ui.datepicker');
```

attribute|optional|value|comment
---------|--------|-----|-------
name|no|text
value|no|text|default date
size|yes|int
fixed-width|yes|xs / sm / md / lg / xl / xxl

####`<ps-password>`

attribute|optional|value|comment
---------|--------|-----|-------
name|no|text

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

## Contribution

Found a bug or have an idea? Use GitHub's tickets system. You can also make a pull request.

## License

PrestUI is licensed under the [MIT licence](http://opensource.org/licenses/MIT)