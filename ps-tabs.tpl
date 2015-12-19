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
	<ps-tab-content>

		<div class="tab-content panel">
			<yield/>
		</div>

		{if $ps_version >= 1.6}

			<style scoped>
				.tab-content {
				  border-top-left-radius: 0 !important;
					border-top-right-radius: 0 !important;
				}
			</style>

		{else}

			<style scoped>
				.tab-content {
					background-color: #ebedf4;
					border: 1px solid #ccced7;
					min-height: 350px;
					padding: 20px;
					margin-left: 140px;
					margin-bottom: 20px;
				}

				.tab-content .tab-pane {
					display: none;
				}

				.tab-content .tab-pane.active {
					display: block;
				}
			</style>

		{/if}

	</ps-tab-content>
</script>

<script type="riot/tag">

	<ps-tab-nav-item>

		<a href="#{ opts.target }" data-toggle="tab" onclick={ changeTab } ><yield/></a>

		{if $ps_version == 1.5}

			<style>
				ps-tab-nav a {
					display: block;
					font-weight: normal;
					color: #666;
					padding: 7px 10px;
					border-top: 1px solid #CCCED7;
					border-right: 1px solid #CCCED7;
				}
			</style>

			changeTab(event) {
				$(event.target).parents('ul.nav-tabs').find('li').removeClass('active')
				$(event.target).parent().addClass('active')
				$(event.target).parents('ps-tabs').find('.tab-content .tab-pane.active').removeClass('active')
				$(event.target).parents('ps-tabs').find('.tab-content '+$(event.target).attr('href')).addClass('active')
				return false
			}

		{/if}

	</ps-tab-nav-item>

</script>

<script type="riot/tag">

	<ps-tab-nav>

		<ul class="nav nav-tabs">
			<yield/>
		</ul>

		{if $ps_version == 1.5}

			<style scoped>
				.active a {
					background-color: #ebedf4;
					font-weight: bold;
					color: #000;
					border-right: none;
				}

				ul.nav-tabs {
					margin: 0;
					padding: 0;
					list-style: none;
				}
			</style>

		{/if}

	</ps-tab-nav>

</script>

<script type="riot/tag">

  <ps-tabs>

		<yield/>

		{if $ps_version == 1.5}
			<style scoped>
				ps-tab-nav {
					background-color: #fafafa;
					border: 1px solid #ccced7;
					border-right: none;
					border-top: none;
					float: left;
					width: 140px;
				}
			</style>
		{/if}

  </ps-tabs>

</script>