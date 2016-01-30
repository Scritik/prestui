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

	<ps-tab>

		<ps-panel>
			<yield/>
		</ps-panel>

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

		$(this.root).addClass('tab-pane')
		if (this.parent && this.parent.opts.position == 'left')
		{
			this.tags['ps-panel'].opts.header = opts.title
			this.tags['ps-panel'].opts.icon = opts.icon
			this.tags['ps-panel'].opts.img = opts.img
		}

	</ps-tab>

</script>

<script type="riot/tag">

  <ps-tabs>

		{if $ps_version >= 1.6}

			<div class="row">

				<div class="{ col-md-2: this.opts.position == 'left', col-md-12: this.opts.position != 'left' }">
					<ul class="{ nav: true, list-group: this.opts.position == 'left', nav-tabs: this.opts.position != 'left' }">
						<li class="{ list-group-item: this.parent.opts.position == 'left', active: tab.opts.active }" each={ tab in this.tags['ps-tab'] }>
							<a href="#{ tab.opts.id }" data-toggle="tab"><i class="{ tab.opts.icon }" if={ tab.opts.icon }></i> { tab.opts.title }</a>
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
						<li each={ tab in this.tags['ps-tab'] } class={ active: tab.opts.active }>
							<a href="#{ tab.opts.id }" onclick={ changeTab }><img src="{ tab.opts.img }" if={ tab.opts.img } /> { tab.opts.title }</a>
						</li>
				</ul>

				<div class="{ tabs-content: true, tabs-content-left: this.opts.position == 'left', tabs-content-top: this.opts.position != 'left' }">
					<yield/>
				</div>

				<div class="clearfix"></div>

			</div>

		{/if}

		this.on('mount', function() {
			that = this
			that.tags['ps-tab'].forEach(function(elem) {
				if (elem.opts.active)
					$(elem.root).addClass('active')
			})
		})

		changeTab(event) {
			$(event.target).parents('ul.tabs-navigation').find('li.active').removeClass('active')
			$(event.target).parents('li').addClass('active')
			$(event.target).parents('.tabs-container').find('ps-tab.active').removeClass('active')
			var target = $(event.target).parents('li').find('a').attr('href')
			$(event.target).parents('.tabs-container').find('ps-tab'+target).addClass('active')
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

				.tabs-navigation li.active {
					background: #EBEDF4;
				}

				.tabs-navigation li.active a {
					color: black;
					font-weight: bold;
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

			</style>

		{/if}

  </ps-tabs>

</script>