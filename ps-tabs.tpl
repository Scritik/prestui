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

    <ps-tab>

        <ps-panel if={ opts.panel != 'false' } icon="{ this.icon }"  header="{ this.header }" img="{ opts.img }" fa="{ opts.fa }">
            <yield/>
        </ps-panel>

        <div if={ opts.panel == 'false' }>
            <yield />
        </div>

        {if $ps_version >= 1.6}

            <style scoped>

                .panel {
                    border-top-left-radius: 0 !important;
                    border-top-right-radius: 0 !important;
                }

            </style>

        {else}

            <style scoped>

                :scope {
                    display: none;
                }

                :scope.active {
                    display: block;
                }

            </style>

        {/if}

        if (this.parent && this.parent.opts.position != 'top') {
            this.header = opts.label;
            this.icon = opts.icon;
        }
        $(this.root).addClass('tab-pane')
        if (this.opts.active == 'true')
            $(this.root).addClass('active')

    </ps-tab>

</script>

<script type="riot/tag">

  <ps-tabs>

        {if $ps_version >= 1.6}

            <div class="row">

                <div class="{ col-md-2: this.opts.position == 'left', col-md-12: this.opts.position != 'left' }">
                    <ul class="{ nav: true, list-group: this.opts.position == 'left', nav-tabs: this.opts.position != 'left' }">
                        <li class="{ list-group-item: this.parent.opts.position == 'left', active: tab.opts.active == 'true' }" each={ tab in this.tabs }>
                            <a href="#{ tab.opts.id }" data-toggle="tab"><i class="{ tab.opts.icon }" if={ tab.opts.icon }></i> { tab.opts.label } <span if={ tab.opts.badge } class="badge pull-right">{ tab.opts.badge }</span></a>
                        </li>
                    </ul>
                </div>

                <div class="{ tab-content: true, col-md-10: this.opts.position == 'left', col-md-12: this.opts.position != 'left' }">
                    <yield/>
                </div>

                <div class="clearfix"></div>
            </div>

        {else}

            <div class="tabs-container">

                <ul class="{ tabs-navigation: true, tabs-navigation-left: this.opts.position == 'left', tabs-navigation-top: this.opts.position != 'left' }">
                        <li each={ tab in this.tabs } class={ active: tab.opts.active == 'true' }>
                            <a href="#{ tab.opts.id }" onclick={ changeTab }>
                            <img src="{ tab.opts.img }" if={ !tab.opts.fa } /><i class="fa fa-{ tab.opts.fa }" if={ tab.opts.fa }></i> { tab.opts.label } <span if={ tab.opts.badge } class="badge pull-right">{ tab.opts.badge }</span>
                            </a>
                        </li>
                </ul>

                <div class="{ tabs-content: true, tabs-content-left: this.opts.position == 'left', tabs-content-top: this.opts.position != 'left' }">
                    <yield/>
                </div>

                <div class="clearfix"></div>

            </div>

        {/if}

        this.on('mount', function() {
            this.tabs = this.tags['ps-tab'];
            this.update();
        })

        // Only PS 1.5
        changeTab(event) {
            // Change active tab
            $(this.root).find('> .tabs-container > ul > li.active').removeClass('active')
            $(event.target).closest('li').addClass('active')

            // Change active tab content
            $(this.root).find('> .tabs-container > .tabs-content > .active').removeClass('active')
            id_target = $(event.target).closest('a').attr('href')
            $(this.root).find('> .tabs-container > .tabs-content > ' + id_target).addClass('active')

            event.preventDefault();

            return false
        }

        {if $ps_version >= 1.6}

            <style scoped>

                li.list-group-item {
                    padding: 0 !important;
                }

                li.list-group-item a {
                    color: #555;
                }

                li.list-group-item:hover {
                    background-color: #f5f5f5;
                }

                li.list-group-item.active a {
                    color: white;
                }

                .nav.list-group li a {
                    text-overflow: ellipsis;
                    white-space: nowrap;
                    overflow: hidden;
                }

                .nav li a .badge {
                    margin-top: -3px;
                    margin-left: 5px;
                }

                .nav.list-group li a .badge {
                    position: absolute;
                    right: 8px;
                    top: 12px;
                }

            </style>

        {else}

            <style scoped>

                .tabs-container {
                    margin: 20px 0;
                }

                .tabs-content-left {
                    margin-left: 200px;
                }

                .tabs-navigation li {
                    background: #fafafa;
                }

                .tabs-navigation li:hover {
                    background: #F1F3F9;
                }

                .tabs-navigation li a {
                    color: #666;
                    cursor: pointer;
                    padding: 10px 15px;
                    display: block;
                    line-height: 18px;
                }

                .tabs-navigation li a img {
                    margin-top: -4px;
                    max-width: 16px;
                    max-height: 16px;
                }

                .tabs-navigation li a .badge {
                    background: #EBEDF4;
                    border: 1px solid #EBEDF4;
                    padding: 2px 5px;
                    margin-top: -3px;
                    margin-right: -5px;
                    float: right;
                    margin-left: 10px;
                }

                .tabs-navigation li.active {
                    background: #EBEDF4;
                }

                .tabs-navigation li.active a {
                    color: black;
                    font-weight: bold;
                }

                .tabs-navigation li.active a .badge {
                    border-color: #CCCED7;
                    background: #fafafa;
                }

                .tabs-navigation.tabs-navigation-top {
                    margin-bottom: -1px;
                }

                .tabs-navigation.tabs-navigation-top li {
                    border: 1px solid #CCCED7;
                    border-right: none;
                    display: inline-block;
                }

                .tabs-navigation.tabs-navigation-top li.active {
                    border-bottom: 1px solid #EBEDF4;
                }

                .tabs-navigation.tabs-navigation-top li:last-child {
                    border-right: 1px solid #CCCED7;
                }

                .tabs-navigation.tabs-navigation-left {
                    float: left;
                    border: 1px solid #CCCED7;
                    width: 180px;
                    margin-top: 11px;
                }

                .tabs-navigation.tabs-navigation-left li {
                    border-bottom: 1px solid #CCCED7;
                }

                .tabs-navigation.tabs-navigation-left li:last-child {
                    border-bottom: none;
                }

                .tabs-navigation.tabs-navigation-left li a {
                    text-overflow: ellipsis;
                    white-space: nowrap;
                    overflow: hidden;
                    position: relative;
                }

                .tabs-navigation.tabs-navigation-left li a .badge {
                    float: none;
                    position: absolute;
                    right: 12px;
                    top: 10px;
                }

            </style>

        {/if}

  </ps-tabs>

</script>
