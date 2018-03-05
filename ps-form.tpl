{*
*	The MIT License (MIT)
*
*	Copyright (c) 2015-2017 Emmanuel MARICHAL
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
                <label class="control-label col-lg-3 { opts.requiredInput == 'true' ? 'required' : '' }">
                    <span class="label-tooltip" data-toggle="tooltip" data-html="true" data-original-title="{ opts.hint }" if={ opts.hint }>{ opts.label }</span>
                    <span if={ !opts.hint }>{ opts.label }</span>
                </label>
                <div class="col-lg-9"><yield/></div>
                <div class="col-lg-9 col-lg-offset-3"><div class="help-block" if={ opts.help }><raw content="{ opts.help }"/></div></div>
            </div>

        {else}

            <div style="clear: both; padding-top:15px;">

                <label class="conf_title"><sup if={ opts.requiredInput }>*&nbsp;</sup>{ opts.label }</label>
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
                        <input type="text" name="{ opts.name }" value="{ opts.riotValue }" class="input { opts.fixedWidth ? 'fixed-width-'+opts.fixedWidth : '' }" placeholder="{ opts.placeholder }" required="{ opts.requiredInput == 'true' }">
                        <span class="input-group-addon" if={ opts.suffix }>{ opts.suffix}</span>
                    </div>

            {else}

                <span if={ opts.prefix }>{ opts.prefix }&nbsp;</span><input type="text" size="{ opts.size }" name="{ opts.name }" value="{ opts.riotValue }" placeholder="{ opts.placeholder }" required="{ opts.requiredInput == 'true' }"><span if={ opts.suffix }>&nbsp;{ opts.suffix }</span>

            {/if}

    </ps-input-text-core>
</script>

<script type="riot/tag">
    <ps-input-text>

        <ps-form-group hint="{ opts.hint }" required-input="{ opts.requiredInput }" label="{ opts.label }" help="{ opts.help }">

            <ps-input-text-core name="{ parent.opts.name }" fixed-width="{ parent.opts.fixedWidth }" suffix="{ parent.opts.suffix }" prefix="{ parent.opts.prefix }" placeholder="{ parent.opts.placeholder }" required-input="{ parent.opts.requiredInput }" size="{ parent.opts.size }" value="{ parent.opts.value }"></ps-input-text-core>

        </ps-form-group>

    </ps-input-text>
</script>

<script type="riot/tag">
    <ps-input-text-lang>

        <ps-form-group hint="{ opts.hint }" required-input="{ opts.requiredInput }" label="{ opts.label }" help="{ opts.help }">

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
                var that = this
                if (Array.isArray(that.tags['ps-form-group'].tags['ps-input-text-lang-value']))
                    values = that.tags['ps-form-group'].tags['ps-input-text-lang-value'];
                else
                    values = [that.tags['ps-form-group'].tags['ps-input-text-lang-value']];
                values.forEach(function(elem) {
                    that.langs.push(elem.opts)
                    $(elem.root).addClass('lang_'+elem.opts.idLang)
                    if (that.opts.activeLang != elem.opts.idLang)
                        $(elem.root).hide()
                })
                that.update()
            })

        {/if}

    </ps-input-text-lang>
</script>

<script type="riot/tag">
    <ps-input-text-lang-value>

        {if $ps_version >= 1.6}
            <div class="translatable-field row lang-{ this.opts.idLang }" style="display: { this.activeLang == this.opts.idLang ? 'block' : 'none' };">
                <div class="col-lg-{ this.parentOpts.colLg }">
                    <ps-input-text-core name="{ this.parentOpts.name }_{ this.opts.idLang }" placeholder="{ opts.placeholder }" required-input="{ this.parentOpts.requiredInput }" fixed-width="{ this.parentOpts.fixedWidth }" value="{ opts.value }"></ps-input-text-core>
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

        {else}

            <ps-input-text-core name="{ this.parentOpts.name }_{ opts.idLang }" placeholder="{ opts.placeholder }" required-input="{ this.parentOpts.requiredInput }" size="{ this.parentOpts.size }" value="{ opts.value }"></ps-input-text-core>

        {/if}

        this.langs = []
        this.parentOpts = []
        this.on('mount', function() {
            that = this
            if (that.parent)
            {
                if (that.parent.parent)
                    that.parentOpts = that.parent.parent.opts
                if (Array.isArray(that.parent.parent.tags['ps-form-group'].tags['ps-input-text-lang-value']))
                    values = that.parent.parent.tags['ps-form-group'].tags['ps-input-text-lang-value'];
                else
                    values = [that.parent.parent.tags['ps-form-group'].tags['ps-input-text-lang-value']];
                values.forEach(function(elem) {
                    that.langs.push(elem.opts)
                })
                that.update()
                if (typeof hideOtherLanguage != 'undefined')
                    hideOtherLanguage(that.parentOpts.activeLang)
            }
        })

    </ps-input-text-lang-value>
</script>

<script type="riot/tag">

    <ps-textarea-core>

        <textarea name="{ opts.name }" class="{ rte: opts.richEditor == 'true', autoload_rte: opts.richEditor == 'true'}" rows="{ opts.rows }" {if $ps_version < 1.6}cols="{ opts.cols }"{/if}><yield/></textarea>

    </ps-textarea-core>

</script>

<script type="riot/tag">

    <ps-textarea>

        <ps-form-group hint="{ opts.hint }" required-input="{ opts.requiredInput }" label="{ opts.label }" help="{ opts.help }">

            <ps-textarea-core rich-editor="{ parent.opts.richEditor }" name="{ parent.opts.name }" rows="{ parent.opts.rows }" cols="{ parent.opts.cols }"><yield/></ps-textarea-core>

        </ps-form-group>

    </ps-textarea>

</script>

<script type="riot/tag">
    <ps-textarea-lang>

        <ps-form-group hint="{ opts.hint }" required-input="{ opts.requiredInput }" label="{ opts.label }" help="{ opts.help }">

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
                if (Array.isArray(that.tags['ps-form-group'].tags['ps-textarea-lang-value']))
                    values = that.tags['ps-form-group'].tags['ps-textarea-lang-value'];
                else
                    values = [that.tags['ps-form-group'].tags['ps-textarea-lang-value']];
                values.forEach(function(elem) {
                    that.langs.push(elem.opts)
                    $(elem.root).addClass('lang_'+elem.opts.idLang)
                    if (that.opts.activeLang != elem.opts.idLang)
                        $(elem.root).hide()
                })
                that.update()
            })

        {/if}

    </ps-textarea-lang>
</script>

<script type="riot/tag">
    <ps-textarea-lang-value>

        {if $ps_version >= 1.6}

            <div class="translatable-field row lang-{ this.opts.idLang }" style="display: { this.parentOpts.activeLang == this.opts.idLang ? 'block' : 'none' };">
                <div class="col-lg-{ this.parentOpts.colLg }">
                    <ps-textarea-core name="{ this.parentOpts.name }_{ this.opts.idLang }" rows="{ this.parentOpts.rows }" cols="{ this.parentOpts.cols }" rich-editor="{ this.parentOpts.richEditor }"><yield/></ps-textarea-core>
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

        {else}

            <ps-textarea-core name="{ this.parentOpts.name }_{ this.opts.idLang }" rows="{ this.parentOpts.rows }" cols="{ this.parentOpts.cols }" rich-editor="{ this.parentOpts.richEditor }"><yield/></ps-textarea-core>

        {/if}

        this.langs = []
        this.parentOpts = []
        this.on('mount', function() {
            that = this
            if (that.parent)
            {
                if (that.parent.parent)
                    that.parentOpts = that.parent.parent.opts
                if (Array.isArray(that.parent.parent.tags['ps-form-group'].tags['ps-textarea-lang-value']))
                    values = that.parent.parent.tags['ps-form-group'].tags['ps-textarea-lang-value'];
                else
                    values = [that.parent.parent.tags['ps-form-group'].tags['ps-textarea-lang-value']];
                values.forEach(function(elem) {
                    that.langs.push(elem.opts)
                })
                that.update()
                if (typeof hideOtherLanguage != 'undefined')
                    hideOtherLanguage(that.parentOpts.activeLang)
            }
        })

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
        if ($("ps-textarea-core .autoload_rte").length > 0) {
            tinySetup({ editor_selector: "autoload_rte" })
        }
    });
</script>

<script type="riot/tag">
    <ps-select>

        <ps-form-group hint="{ opts.hint }" required-input="{ opts.requiredInput }" label="{ opts.label }" help="{ opts.help }">
            <select name={ parent.opts.name } class="{ parent.opts.chosen == 'true' ? 'chosen' : '' } {if $ps_version >= 1.6}{ parent.opts.fixedWidth ? 'fixed-width-'+parent.opts.fixedWidth : '' }{/if}" onChange={ parent.toggleChangeEvent }>
                <yield/>
            </select>
        </ps-form-group>

        <style scoped>

            .chosen-container {
                width: 250px !important;
            }

        </style>

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

        <ps-form-group hint="{ opts.hint }" required-input="{ opts.requiredInput }" label="{ opts.label }" help="{ opts.help }">
            <div class="hide"><yield/></div>
            <table class="table table-bordered" cellpadding="0" cellspacing="0">
                <thead>
                    <tr>
                        <th class="fixed-width-xs">
                            <span class="title_box">
                                <input type="checkbox" name="checkme" id="checkme" onclick="checkDelBoxes(this.form, '{ parent.opts.name }[]', this.checked)">
                            </span>
                        </th>
                        <th class="fixed-width-xs"><span class="title_box">ID</span></th>
                        <th><span class="title_box">{ parent.opts.columnTitle }</span></th>
                    </tr>
                </thead>
                <tbody>
                    <tr each={ group in this.parent.groups }>
                        <td><input type="checkbox" name="{ group.name }[]" class="groupBox" id="{ group.name }_{ group.value }" value="{ group.value }"></td>
                        <td>{ group.value }</td>
                        <td><label for="{ group.name }_{ group.value }" class="t">{ group.content }</label></td>
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

        this.groups = []

        this.on('mount', function() {
            that = this
            if (that.parent)
            {
                that.tags['ps-form-group'].tags['ps-group'].forEach(function(elem) {
                    group = []
                    group['value'] = elem.opts.value
                    group['content'] = elem.root.innerHTML
                    group['name'] = that.opts.name
                    that.groups.push(group)
                })
                that.update()
            }
        })

    </ps-groups>
</script>

<script type="riot/tag">
    <ps-radios>

        <ps-form-group hint="{ opts.hint }" required-input="{ opts.requiredInput }" label="{ opts.label }" help="{ opts.help }">
            <yield/>
        </ps-form-group>

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

        <ps-form-group hint="{ opts.hint }" required-input="{ opts.requiredInput }" label="{ opts.label }" help="{ opts.help }">
            <yield/>
        </ps-form-group>

    </ps-checkboxes>
</script>

<script type="riot/tag">
    <ps-checkbox>

        {if $ps_version >= 1.6}

            <div class="checkbox">
                <label>
                    <input type="checkbox" name="{ opts.name }[]" checked={ opts.checked == 'true' } value="{ opts.value }">
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
        <ps-form-group hint="{ opts.hint }" required-input="{ opts.requiredInput }" label="{ opts.label }" help="{ opts.help }">
            <div class="{if $ps_version == '1.6'}input-group{/if} { parent.opts.fixedWidth ? 'fixed-width-'+parent.opts.fixedWidth : '' }">
                <input type="color" size="{ parent.opts.size || 20 }" data-hex="true" class="color mColorPickerInput mColorPicker" name="{ parent.opts.name }" id="{ parent.opts.name }">
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

        this.on('mount', function() {
            // Fix for mColorPicker
            $(this.root).find('input[type=color]').attr('value', opts.color)
        })

    </ps-color-picker>
</script>

<script type="riot/tag">
    <ps-password>
        <ps-form-group hint="{ opts.hint }" required-input="{ opts.requiredInput }" label="{ opts.label }" help="{ opts.help }">

            {if $ps_version >= 1.6}

                <div class="input-group { parent.opts.fixedWidth ? 'fixed-width-'+parent.opts.fixedWidth : '' }">
                    <span class="input-group-addon">
                        <i class="icon-key"></i>
                    </span>
                    <input type="password" name="{ parent.opts.name }" required="{ parent.opts.requiredInput == 'true' }">
                </div>

            {else}

                <input type="password" size="{ parent.opts.size }" name="{ parent.opts.name }" required="{ parent.opts.requiredInput == 'true' }">

            {/if}

        </ps-form-group>
    </ps-password>
</script>

<script type="riot/tag">
    <ps-date-picker>
        <ps-form-group hint="{ opts.hint }" required-input="{ opts.requiredInput }" label="{ opts.label }" help="{ opts.help }">

            {if $ps_version >= 1.6}

                <div class="input-group { parent.opts.fixedWidth ? 'fixed-width-'+parent.opts.fixedWidth : '' }">
                    <input id="{ parent.opts.name }" type="text" data-hex="true" class="datepicker" name="{ parent.opts.name }" value="{ parent.opts.value }" required="{ parent.opts.requiredInput == 'true' }" />
                    <span class="input-group-addon">
                        <i class="icon-calendar-empty"></i>
                    </span>
                </div>

            {else}

                <input id="{ parent.opts.name }" type="text" data-hex="true" size="{ parent.opts.size }" class="datepicker" name="{ parent.opts.name }" value="{ parent.opts.value }" required="{ parent.opts.requiredInput == 'true' }" />

            {/if}

        </ps-form-group>


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

<script type="riot/tag">
    <ps-switch>

        <ps-form-group hint="{ opts.hint }" required-input="{ opts.requiredInput }" label="{ opts.label }" help="{ opts.help }">

            {if $ps_version >= 1.6}

                <span class="switch prestashop-switch fixed-width-lg">

                    <input type="radio" name="{ parent.opts.name }" id="{ parent.opts.name }_on" value="1" checked={ parent.opts.active == 'true' } disabled="{ parent.opts.disabled == 'true' }" onchange={ parent.toggleSwitchEvent } />
                    <label for="{ parent.opts.name }_on">{ parent.opts.yes }</label>

                    <input type="radio" name="{ parent.opts.name }" id="{ parent.opts.name }_off" value="0" checked={ parent.opts.active != 'true' } disabled="{ parent.opts.disabled == 'true' }" onchange={ parent.toggleSwitchEvent } />
                    <label for="{ parent.opts.name }_off">{ parent.opts.no }</label>

                    <a class="slide-button btn"></a>

                </span>

            {else}

                <label class="t" for="{ parent.opts.name }_on"><img src="../img/admin/enabled.gif" alt="{ parent.opts.yes }" title="{ parent.opts.yes }"></label>
                <input type="radio" name="{ parent.opts.name }" id="{ parent.opts.name }_on" value="1" checked={ parent.opts.active == 'true' } onChange={ parent.toggleSwitchEvent } />
                <label class="t" for="{ parent.opts.name }_on"> { parent.opts.yes }</label>
                <label class="t" for="{ parent.opts.name }_off"><img src="../img/admin/disabled.gif" alt="{ parent.opts.no }" title="{ parent.opts.no }" style="margin-left: 10px;"></label>
                <input type="radio" name="{ parent.opts.name }" id="{ parent.opts.name }_off" value="0" checked={ parent.opts.active != 'true' } onChange={ parent.toggleSwitchEvent } />
                <label class="t" for="{ parent.opts.name }_off"> { parent.opts.no }</label>

            {/if}

        </ps-form-group>

        toggleSwitchEvent(e) {
            if (typeof window[this.opts.onSwitch] !== 'undefined') {
                window[this.opts.onSwitch](+e.target.value);
            }
        }

    </ps-switch>
</script>
