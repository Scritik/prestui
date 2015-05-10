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

		{if $ps_version == '1.6'}

			<div class="form-group">
				<label class="control-label col-lg-3">
					<span class="label-tooltip" data-toggle="tooltip" data-html="true" data-original-title="{ opts.hint }" if={ opts.hint }>{ opts.label }</span>
					<span if={ !opts.hint }>{ opts.label }</span>
				</label>
				<div class="col-lg-9"><yield/></div>
				<div class="col-lg-9 col-lg-offset-3"><div class="help-block" if={ opts.help }>{ opts.help }</div></div>
			</div>

		{else}

			<div style="clear: both; padding-top:15px;">

				<label class="conf_title">{ opts.label }</label>
				<div class="margin-form">
					<yield/>
					<p class="preference_description" if={ opts.help }>{ opts.help }</p>
				</div>
			</div>

		{/if}

	</ps-form-group>
</script>

<script type="riot/tag">
	<ps-input-text>

		<ps-form-group>

			{if $ps_version == '1.6'}

				<div class="{literal}{ opts.prefix || opts.suffix ? 'input-group input ' : '' }{ opts['fixed-width'] ? 'fixed-width-'+opts['fixed-width'] : '' }{/literal}">
					<span class="input-group-addon" if={ opts.prefix }>{ opts.prefix}</span>
					<input type="text" name="{ opts.name }" value="{ opts.value }" class="input { opts['fixed-width'] ? 'fixed-width-'+opts['fixed-width'] : '' }">
					<span class="input-group-addon" if={ opts.suffix }>{ opts.suffix}</span>
				</div>

			{else}

				<span if={ opts.prefix }>{ opts.prefix }&nbsp;</span><input type="text" size="{ opts.size }" name="{ opts.name }" value="{ opts.value }"><span if={ opts.suffix }>&nbsp;{ opts.suffix }</span><sup if={ opts.required }>*</sup>

			{/if}

		</ps-form-group>

		this.tags['ps-form-group'].opts = opts

	</ps-input-text>
</script>

<script type="riot/tag">
	<ps-switch>

		<ps-form-group>

			{if $ps_version == '1.6'}

				<span class="switch prestashop-switch fixed-width-lg">
					<input type="radio" name="{ opts.name }" id="{ opts.name }_on" value="1" checked={ opts.active == 'true' } disabled="{ opts.disabled == 'true' }">
					<label for="{ opts.name }_on">{ opts.yes }</label>
					<input type="radio" name="{ opts.name }" id="{ opts.name }_off" value="0" checked={ opts.active != 'true' } disabled="{ opts.disabled == 'true' }">
					<label for="{ opts.name }_off">{ opts.no }</label>
					<a class="slide-button btn"></a>
				</span>

			{else}

				<label class="t" for="{ opts.name }_on"><img src="../img/admin/enabled.gif" alt="{ opts.yes }" title="{ opts.yes }"></label>
				<input type="radio" name="{ opts.name }" id="{ opts.name }_on" value="1" checked={ opts.active == 'true' }>
				<label class="t" for="{ opts.name }_on"> { opts.yes }</label>
				<label class="t" for="{ opts.name }_off"><img src="../img/admin/disabled.gif" alt="{ opts.no }" title="{ opts.no }" style="margin-left: 10px;"></label>
				<input type="radio" name="{ opts.name }" id="{ opts.name }_off" value="0" checked={ opts.active != 'true' }>
				<label class="t" for="{ opts.name }_off"> { opts.no }</label>

			{/if}

		</ps-form-group>

		this.tags['ps-form-group'].opts = opts

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

		{if $ps_version == '1.6'}

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

		{if $ps_version == '1.6'}

			<div class="checkbox">
				<label for="{ opts.name }_{ opts.value }">
					<input type="checkbox" name="{ opts.name }" id="{ opts.name }_{ opts.value }" checked={ opts.checked == 'true' }>
					<yield/>
				</label>
			</div>

		{else}

			<input type="checkbox" name="{ opts.name }" id="{ opts.name }_{ opts.value }" value="{ opts.value }" checked={ opts.checked == 'true' }>
			<label class="t" for="{ opts.name }_{ opts.value }"><yield/></label>
			<br>

		{/if}

	</ps-checkbox>
</script>

<script type="text/javascript">
	tags.push('ps-input-text', 'ps-form-group', 'ps-switch', 'ps-radios', 'ps-radio', 'ps-checkbox', 'ps-checkboxes', 'ps-input-file');
</script>