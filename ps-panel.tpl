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
    <ps-panel-footer>
        <div class="panel-footer">
            <yield/>
        </div>

        <style scoped>

            {if $ps_version >= 1.6}

                .btn.pull-right {
                    margin-left: 5px;
                }
                .btn.pull-left {
                    margin-right: 5px;
                }

                a.btn i {
                    display: block;
                    width: 30px;
                    height: 30px;
                    margin: 0 auto;
                    font-size: 28px;
                    background: transparent;
                    background-size: 26px;
                    background-position: center
                }

            {else}

                .panel-footer {
                    margin: 20px -13px 0px;
                    background: rgba(182, 182, 182, 0.1);
                    display: block;
                    border-top: 1px solid rgba(160, 160, 160, 0.19);
                    height: 80px;
                    position: relative;
                    bottom: -13px;
                }

                .btn {
                    margin: 0;
                    background: none;
                    border: none;
                    padding: 0 20px;
                    outline: none;
                    cursor: pointer;
                    font-size: 11px;
                    text-align: center;
                    height: 100%;
                    line-height: normal;
                }

                .btn.pull-right {
                    border-left: 1px solid rgba(160, 160, 160, 0.19);
                    float: right;
                }

                .btn.pull-left {
                    border-right: 1px solid rgba(160, 160, 160, 0.19);
                    float: left;
                }

                .btn:hover {
                    background: rgba(182, 182, 182, 0.1);
                }

                .btn img {
                    display: block;
                    padding: 0;
                    margin-bottom: 5px;
                    margin-left: auto;
                    margin-right: auto;
                }

            {/if}

        </style>
    </ps-panel-footer>
</script>

<script type="riot/tag">
    <ps-panel-footer-submit>

        {if $ps_version >= 1.6}

            <button type="submit" class="btn btn-default pull-{ opts.direction }" name="{ opts.name }">
                <i class="{ opts.icon }"></i> { opts.title }
            </button>

        {else}

            <button type="submit" class="btn pull-{ opts.direction }" name="{ opts.name }">
                <img src="{ opts.img }" if={ !opts.fa } /><i class="fa fa-{ opts.fa }" if={ opts.fa }></i> { opts.title }
            </button>

            <style scoped>

                button i.fa {
                    display: block;
                    font-size: 2.5em;
                    margin-bottom: 5px;
                    color: #585a69;
                }

            </style>

        {/if}

    </ps-panel-footer-submit>
</script>

<script type="riot/tag">
    <ps-panel-footer-link>

        {if $ps_version >= 1.6}

            <a class="btn btn-default pull-{ opts.direction }" href="{ opts.href }" target="{ opts.newTab == 'true' ? '_blank' : '' }">
                <i class="{ opts.icon }"></i> { opts.title }
            </a>

        {else}

            <a class="btn pull-{ opts.direction }" href="{ opts.href }" target="{ opts.newTab == 'true' ? '_blank' : '' }">
                <img src="{ opts.img }" if={ !opts.fa } /><i class="fa fa-{ opts.fa }" if={ opts.fa }></i> { opts.title }
            </a>

            <style scoped>

                a img {
                    margin-top: 15px;
                }

                a i.fa {
                    display: block;
                    font-size: 2.5em;
                    margin-bottom: 5px;
                    color: #585a69;
                    margin-top: 18px;
                }

            </style>

        {/if}

    </ps-panel-footer-link>
</script>

<script type="riot/tag">
    <ps-panel>

        {if $ps_version >= 1.6}

            <div class="panel">
                <div class="panel-heading" if={ opts.icon || opts.header }>
                        <i class="{ opts.icon }" if={ opts.icon }></i> { opts.header }
                </div>

                <yield/>

            </div>

        {else}

            <fieldset>
                <legend if={ opts.header }>
                    <img src="{ opts.img }" if={ !opts.fa } /><i class="fa fa-{ opts.fa }" if={ opts.fa }></i> { opts.header }
                </legend>

                <yield/>

            </fieldset>

            <style scoped>

                fieldset {
                    margin-bottom: 20px;
                    margin-left: auto;
                    margin-right: auto;
                }

            </style>

        {/if}

    </ps-panel>
</script>

<script type="riot/tag">
    <ps-panel-divider>

        {if $ps_version >= 1.6}
            <hr/>
        {else}
            <div class="separation"></div>
        {/if}

    </ps-panel-divider>
</script>
