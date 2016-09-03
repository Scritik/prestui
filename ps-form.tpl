{*
*	The MIT License (MIT)
*
*	Copyright (c) 2015 Emmanuel MARICHAL
*
*	Permission is hereby granted, free of charge, to any person obtaining a copy
*	of this software and associated documentation files (the "Software"), to deal
*	in the Software without restriction, including without limitation the rights
*	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
*	copies of the Software, and to permit persons to whom the Software is
*	furnished to do so, subject to the following conditions:
*
*	The above copyright notice and this permission notice shall be included in
*	all copies or substantial portions of the Software.
*
*	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
*	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
*	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
*	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
*	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
*	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
*	THE SOFTWARE.
*}

<script type="riot/tag">
	<ps-form-group>

		{if $ps_version >= 1.6}

			<div class="form-group">
				<label class="control-label col-lg-3 { opts.required == 'true' ? 'required' : '' }">
					<span class="label-tooltip" data-toggle="tooltip" data-html="true" data-original-title="{ opts.hint }" if={ opts.hint }>{ opts.label }</span>
					<span if={ !opts.hint }>{ opts.label }</span>
				</label>
				<div class="col-lg-9"><yield/></div>
				<div class="col-lg-9 col-lg-offset-3"><div class="help-block" if={ opts.help }><raw content="{ opts.help }"/></div></div>
			</div>

		{else}

			<div style="clear: both; padding-top:15px;">

				<label class="conf_title"><sup if={ opts.required }>*&nbsp;</sup>{ opts.label }</label>
				<div class="margin-form">
					<yield/>
					<p class="preference_description" if={ opts.help }><raw content="{ opts.help }"/></p>
				</div>
			</div>

		{/if}

	</ps-form-group>
</script>

<script type="riot/tag">
	<ps-input-text-core>

			{if $ps_version >= 1.6}

					<div class="{literal}{ opts.prefix || opts.suffix ? 'input-group input ' : '' }{ opts.fixedWidth ? 'fixed-width-'+opts.fixedWidth : '' }{/literal}">
						<span class="input-group-addon" if={ opts.prefix }>{ opts.prefix}</span>
						<input type="text" name="{ opts.name }" value="{ opts.value }" class="input { opts.fixedWidth ? 'fixed-width-'+opts.fixedWidth : '' }" placeholder="{ opts.placeholder }" required="{ opts.requiredInput == 'true' }">
						<span class="input-group-addon" if={ opts.suffix }>{ opts.suffix}</span>
					</div>

			{else}

				<span if={ opts.prefix }>{ opts.prefix }&nbsp;</span><input type="text" size="{ opts.size }" name="{ opts.name }" value="{ opts.value }" placeholder="{ opts.placeholder }" required="{ opts.requiredInput == 'true' }"><span if={ opts.suffix }>&nbsp;{ opts.suffix }</span>

			{/if}

	</ps-input-text-core>
</script>

<script type="riot/tag">
	<ps-input-text>

		<ps-form-group>

			<ps-input-text-core name="{ opts.name }" fixed-width="{ opts.fixedWidth }" suffix="{ opts.suffix }" prefix="{ opts.prefix }" placeholder="{ opts.placeholder }" required-input="{ opts.requiredInput }" size="{ opts.size }" value="{ opts.value }"></ps-input-text-core>

		</ps-form-group>

		this.tags['ps-form-group'].opts = opts

	</ps-input-text>
</script>

<script type="riot/tag">
	<ps-input-text-lang>

		<ps-form-group>

			{if $ps_version >= 1.6}

				<yield/>

			{else}

				<div class="translatable">

					<yield/>

					<div class="displayed_flag"><img class="language_current pointer" src="../img/l/{ this.parent.opts.activeLang }.jpg" onclick="toggleLanguageFlags(this);"></div>
					<div class="language_flags" style="display: none;">
						<img class="pointer" src="../img/l/{ lang.idLang }.jpg" alt="{ lang.langName }" each={ lang in this.parent.langs } onclick="changeFormLanguage({ lang.idLang }, '{ lang.isoLang }', 0)">
					</div>
				</div>

			{/if}

		</ps-form-group>

		{if $ps_version == 1.5}

			<style scoped>

				.language_flags .pointer {
					margin: 2px;
				}

				.translatable div[class^=lang_] {
					float: left;
				}

			</style>

			this.langs = []

			this.on('mount', function() {
				that = this
				that.tags['ps-form-group'].tags['ps-input-text-lang-value'].forEach(function(elem) {
					that.langs.push(elem.opts)
					$(elem.root).addClass('lang_'+elem.opts.idLang)
					if (that.opts.activeLang != elem.opts.idLang)
						$(elem.root).hide()
				})
				that.update()
			})

		{/if}

		this.tags['ps-form-group'].opts = opts

	</ps-input-text-lang>
</script>

<script type="riot/tag">
	<ps-input-text-lang-value>

		{if $ps_version >= 1.6}

			<div class="translatable-field row lang-{ this.opts.idLang }" style="display: { this.parent.opts.activeLang == this.opts.idLang ? 'block' : 'none' };">
				<div class="col-lg-{ this.parent.opts.colLg }">
					<ps-input-text-core name="{ this.parent.opts.name }_{ this.opts.idLang }" placeholder="{ opts.placeholder }" required-input="{ this.parent.opts.requiredInput }" fixed-width="{ this.parent.opts.fixedWidth }" value="{ opts.value }"></ps-input-text-core>
				</div>
				<div class="col-lg-2">
					<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" tabindex="-1">
						{ this.opts.isoLang }
						<span class="caret"></span>
					</button>
					<ul class="dropdown-menu">
						<li each={ dropdown_lang in this.langs }>
							<a href="javascript:hideOtherLanguage({ dropdown_lang.idLang });">{ dropdown_lang.langName }</a>
						</li>
					</ul>
				</div>
			</div>

			this.langs = []

			this.on('mount', function() {
				that = this
				if (that.parent)
				{
					that.parent.tags['ps-input-text-lang-value'].forEach(function(elem) {
						that.langs.push(elem.opts)
					})
					that.update()
				}
			})

		{else}

			<ps-input-text-core name="{ this.parent.opts.name }_{ this.opts.idLang }" placeholder="{ opts.placeholder }" required-input="{ this.parent.opts.requiredInput }" size="{ this.parent.opts.size }" value="{ opts.value }"></ps-input-text-core>

		{/if}

	</ps-input-text-lang-value>
</script>

<script type="riot/tag">

	<ps-textarea-core>

		<textarea name="{ opts.name }" class="{ rte: opts.richEditor == 'true', autoload_rte: opts.richEditor == 'true'}" rows="{ opts.rows }" {if $ps_version < 1.6}cols="{ opts.cols }"{/if}><yield/></textarea>

	</ps-textarea-core>

</script>

<script type="riot/tag">

	<ps-textarea>

		<ps-form-group>

			<ps-textarea-core rich-editor="{ opts.richEditor }" name="{ opts.name }" rows="{ opts.rows }" cols="{ opts.cols }"><yield/></ps-textarea-core>

		</ps-form-group>

		this.tags['ps-form-group'].opts = opts

	</ps-textarea>

</script>

<script type="riot/tag">
	<ps-textarea-lang>

		<ps-form-group>

			{if $ps_version >= 1.6}

				<yield/>

			{else}

				<div class="translatable">

					<yield/>

					<div class="displayed_flag"><img class="language_current pointer" src="../img/l/{ this.parent.opts.activeLang }.jpg" onclick="toggleLanguageFlags(this);"></div>
					<div class="language_flags" style="display: none;">
						<img class="pointer" src="../img/l/{ lang.idLang }.jpg" alt="{ lang.langName }" each={ lang in this.parent.langs } onclick="changeFormLanguage({ lang.idLang }, '{ lang.isoLang }', 0)">
					</div>
				</div>

			{/if}

		</ps-form-group>

		{if $ps_version == 1.5}

			<style scoped>

				.language_flags .pointer {
					margin: 2px;
				}

				.translatable div[class^=lang_] {
					float: left;
				}

			</style>

			this.langs = []

			this.on('mount', function() {
				that = this
				that.tags['ps-form-group'].tags['ps-textarea-lang-value'].forEach(function(elem) {
					that.langs.push(elem.opts)
					$(elem.root).addClass('lang_'+elem.opts.idLang)
					if (that.opts.activeLang != elem.opts.idLang)
						$(elem.root).hide()
				})
				that.update()
			})

		{/if}

		this.tags['ps-form-group'].opts = opts

	</ps-textarea-lang>
</script>

<script type="riot/tag">
	<ps-textarea-lang-value>

		{if $ps_version >= 1.6}

			<div class="translatable-field row lang-{ this.opts.idLang }" style="display: { this.parent.opts.activeLang == this.opts.idLang ? 'block' : 'none' };">
				<div class="col-lg-{ this.parent.opts.colLg }">
					<ps-textarea-core name="{ this.parent.opts.name }_{ this.opts.idLang }" rows="{ this.parent.parent.opts.rows }" cols="{ this.parent.parent.opts.cols }" rich-editor="{ this.parent.opts.richEditor }"><yield/></ps-textarea-core>
				</div>
				<div class="col-lg-2">
					<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" tabindex="-1">
						{ this.opts.isoLang }
						<span class="caret"></span>
					</button>
					<ul class="dropdown-menu">
						<li each={ dropdown_lang in this.langs }>
							<a href="javascript:hideOtherLanguage({ dropdown_lang.idLang });">{ dropdown_lang.langName }</a>
						</li>
					</ul>
				</div>
			</div>

			this.langs = []

			this.on('mount', function() {
				that = this
				if (that.parent)
				{
					that.parent.tags['ps-textarea-lang-value'].forEach(function(elem) {
						that.langs.push(elem.opts)
					})
					that.update()
				}
			})

		{else}

			<ps-textarea-core name="{ this.parent.opts.name }_{ this.opts.idLang }" rows="{ this.parent.parent.opts.rows }" cols="{ this.parent.parent.opts.cols }" rich-editor="{ this.parent.opts.richEditor }"><yield/></ps-textarea-core>

		{/if}

	</ps-textarea-lang-value>
</script>

{if $ps_version < 1.6}
	<script type="text/javascript" src="{$smarty.const.__PS_BASE_URI__|escape:'quotes':'UTF-8'}/js/tinymce.inc.js"></script>
{/if}

<script type="text/javascript">
	var iso = iso_user;
	var pathCSS = "{$smarty.const._THEME_CSS_DIR_|escape:'quotes':'UTF-8'}";
	var ad = "{$smarty.const.__PS_BASE_URI__|escape:'htmlall':'UTF-8'}{basename($smarty.const._PS_ADMIN_DIR_)|escape:'quotes':'UTF-8'}";

	$( document ).ready(function() {
		if ($("ps-textarea .autoload_rte").length > 0) {
			tinySetup({ editor_selector: "autoload_rte" })
		}
	});
</script>

<script type="riot/tag">
	<ps-select>

		<ps-form-group>
			<select name={ opts.name } class="{ opts.chosen == 'true' ? 'chosen' : '' } {if $ps_version >= 1.6}{ opts.fixedWidth ? 'fixed-width-'+opts.fixedWidth : '' }{/if}" onChange={ toggleChangeEvent }>
				<yield/>
			</select>
		</ps-form-group>

		this.tags['ps-form-group'].opts = opts

		toggleChangeEvent(e) {
			if (e.target)
				window[this.opts.onChange](e.target.value);
			else
				window[this.opts.onChange](e.currentTarget.value); // Chosen
			e.stopPropagation(); // Chosen
		}

	</ps-select>
</script>

<script type="riot/tag">
	<ps-group>
		<yield/>
	</ps-group>
</script>

<script type="riot/tag">
	<ps-groups>

		<ps-form-group>
			<div class="hide"><yield/></div>
			<table class="table table-bordered" cellpadding="0" cellspacing="0">
				<thead>
					<tr>
						<th class="fixed-width-xs">
							<span class="title_box">
								<input type="checkbox" name="checkme" id="checkme" onclick="checkDelBoxes(this.form, '{ this.opts.name }[]', this.checked)">
							</span>
						</th>
						<th class="fixed-width-xs"><span class="title_box">ID</span></th>
						<th><span class="title_box">{ this.opts.columnTitle }</span></th>
					</tr>
				</thead>
				<tbody>
					<tr each={ group in this.groups }>
						<td><input type="checkbox" name="{ group.parent.opts.name }[]" class="groupBox" id="{ group.parent.opts.name }_{ group.opts.value }" value="{ group.opts.value }"></td>
						<td>{ group.opts.value }</td>
						<td><label for="{ group.parent.opts.name }_{ group.opts.value }" class="t">{ group.root.innerHTML }</label></td>
					</tr>
				</tbody>
			</table>
		</ps-form-group>

		<style scoped>

			.hide {
				display: none;
			}

			table {
				width: auto !important;
				min-width: 28em;
			}

		</style>

		console.log(this.opts.name);
		this.tags['ps-form-group'].opts = opts
		this.groups = this.tags['ps-form-group'].tags['ps-group']
		if (!this.groups.length)
			this.groups = [this.groups];

	</ps-groups>
</script>

<script type="riot/tag">
	<ps-switch>

		<ps-form-group>

			{if $ps_version >= 1.6}

				<span class="switch prestashop-switch fixed-width-lg">
					<input type="radio" name="{ opts.name }" id="{ opts.name }_on" value="1" checked={ opts.active == 'true' } disabled="{ opts.disabled == 'true' }" onChange={ toggleSwitchEvent }>
					<label for="{ opts.name }_on">{ opts.yes }</label>
					<input type="radio" name="{ opts.name }" id="{ opts.name }_off" value="0" checked={ opts.active != 'true' } disabled="{ opts.disabled == 'true' }" onChange={ toggleSwitchEvent }>
					<label for="{ opts.name }_off">{ opts.no }</label>
					<a class="slide-button btn"></a>
				</span>

			{else}

				<label class="t" for="{ opts.name }_on"><img src="../img/admin/enabled.gif" alt="{ opts.yes }" title="{ opts.yes }"></label>
				<input type="radio" name="{ opts.name }" id="{ opts.name }_on" value="1" checked={ opts.active == 'true' } onChange={ toggleSwitchEvent }>
				<label class="t" for="{ opts.name }_on"> { opts.yes }</label>
				<label class="t" for="{ opts.name }_off"><img src="../img/admin/disabled.gif" alt="{ opts.no }" title="{ opts.no }" style="margin-left: 10px;"></label>
				<input type="radio" name="{ opts.name }" id="{ opts.name }_off" value="0" checked={ opts.active != 'true' } onChange={ toggleSwitchEvent }>
				<label class="t" for="{ opts.name }_off"> { opts.no }</label>

			{/if}

		</ps-form-group>

		this.tags['ps-form-group'].opts = opts

		toggleSwitchEvent(e) {
			window[this.opts.onSwitch](+e.target.value);
		}

	</ps-switch>
</script>

<script type="riot/tag">
	<ps-radios>

		<ps-form-group>
			<yield/>
		</ps-form-group>

		this.tags['ps-form-group'].opts = opts

	</ps-radios>
</script>

<script type="riot/tag">
	<ps-radio>

		{if $ps_version >= 1.6}

			<div class="radio">
				<label><input type="radio" name="{ opts.name }" id="{ opts.name }_{ opts.value }" value="{ opts.value }" checked={ opts.checked == 'true' }><yield/></label>
			</div>

		{else}

			<input type="radio" name="{ opts.name }" id="{ opts.name }_{ opts.value }" value="{ opts.value }" checked={ opts.checked == 'true' }>
			<label class="t" for="{ opts.name }_{ opts.value }"><yield/></label>
			<br>

		{/if}

	</ps-radio>
</script>

<script type="riot/tag">
	<ps-checkboxes>

		<ps-form-group>
			<yield/>
		</ps-form-group>

		this.tags['ps-form-group'].opts = opts

	</ps-checkboxes>
</script>

<script type="riot/tag">
	<ps-checkbox>

		{if $ps_version >= 1.6}

			<div class="checkbox">
				<label for="{ opts.name }_{ opts.value }">
					<input type="checkbox" name="{ opts.name }" checked={ opts.checked == 'true' } value="{ opts.value }">
					<yield/>
				</label>
			</div>

		{else}

			<input type="checkbox" name="{ opts.name }" value="{ opts.value }" checked={ opts.checked == 'true' }>
			<label class="t" for="{ opts.name }_{ opts.value }"><yield/></label>
			<br>

		{/if}

	</ps-checkbox>
</script>

<script type="riot/tag">
	<ps-color-picker>
		<ps-form-group>

			<div class="{if $ps_version == '1.6'}input-group{/if} { opts.fixedWidth ? 'fixed-width-'+opts.fixedWidth : '' }">
				<input type="color" size="{ opts.size || 20 }" data-hex="true" class="color mColorPickerInput mColorPicker" name="{ opts.name }" id="{ opts.name }">
			</div>

			<style scoped>
				img {
					border: 0;
					margin:0 0 0 3px;
				}

				span {
					cursor: pointer;
				}
			</style>

		</ps-form-group>

		this.tags['ps-form-group'].opts = opts
		this.on('mount', function() {
			// Fix for mColorPicker
			$(this.root).find('input[type=color]').attr('value', opts.color)
		})


	</ps-color-picker>
</script>

<script type="riot/tag">
	<ps-password>
		<ps-form-group>

			{if $ps_version >= 1.6}

				<div class="input-group { opts.fixedWidth ? 'fixed-width-'+opts.fixedWidth : '' }">
					<span class="input-group-addon">
						<i class="icon-key"></i>
					</span>
					<input type="password" name="{ opts.name }" required="{ opts.requiredInput == 'true' }" value="{ opts.value }">
				</div>

			{else}

				<input type="password" size="{ opts.size }" name="{ opts.name }" required="{ opts.requiredInput == 'true' }" value="{ opts.value }">

			{/if}

		</ps-form-group>

		this.tags['ps-form-group'].opts = opts

	</ps-password>
</script>

<script type="riot/tag">
	<ps-date-picker>
		<ps-form-group>

			{if $ps_version >= 1.6}

				<div class="input-group { opts.fixedWidth ? 'fixed-width-'+opts.fixedWidth : '' }">
					<input id="{ opts.name }" type="text" data-hex="true" class="datepicker" name="{ opts.name }" value="{ opts.value }" required="{ opts.requiredInput == 'true' }" />
					<span class="input-group-addon">
						<i class="icon-calendar-empty"></i>
					</span>
				</div>

			{else}

				<input id="{ opts.name }" type="text" data-hex="true" size="{ opts.size }" class="datepicker" name="{ opts.name }" value="{ opts.value }" required="{ opts.requiredInput == 'true' }" />

			{/if}

		</ps-form-group>

		this.tags['ps-form-group'].opts = opts

	</ps-date-picker>
</script>

<script type="text/javascript">
	$( document ).ready(function() {
		if ($("ps-date-picker .datepicker").length > 0) {
			$("ps-date-picker .datepicker").datepicker({
					prevText: '',
					nextText: '',
					dateFormat: 'yy-mm-dd'
			});
		}
	});
</script>
