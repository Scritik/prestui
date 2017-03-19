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
	<ps-alert>

		{if $ps_version >= 1.6}

			<div class="alert { opts['alertClass'] }">
				<button type="button" class="close" data-dismiss="alert">×</button>
				<yield/>
			</div>

		{else}

			<div class="{ opts['alertClass'] }">
				<yield/>
				<img class="close" alt="X" src="../img/admin/close.png" onclick={ hide }>
			</div>

			<style scoped>

				div {
					position: relative;
					padding-right: 25px !important;
				}

				img.close {
					margin: 0 !important;
					position: absolute;
					right: 10px;
					top: 15px;
					cursor: pointer;
				}

			</style>

			hide(e) {
				$(e.target).parent().hide()
			}

		{/if}

	</ps-alert>
</script>


<script type="riot/tag">
	<ps-alert-success>

		<ps-alert alert-class="{if $ps_version == 1.5}conf{else}alert alert-success{/if}">
			<yield/>
		</ps-alert>

	</ps-alert-success>
</script>

<script type="riot/tag">
	<ps-alert-error>

		<ps-alert alert-class="{if $ps_version == 1.5}error{else}alert alert-danger{/if}">
			<yield/>
		</ps-alert>

	</ps-alert-error>
</script>

<script type="riot/tag">
	<ps-alert-warn>

		<ps-alert alert-class="{if $ps_version == 1.5}warn{else}alert alert-warning{/if}">
			<yield/>
		</ps-alert>

	</ps-alert-warn>
</script>

<script type="riot/tag">
	<ps-alert-hint>

		<ps-alert alert-class="{if $ps_version == 1.5}hint{else}alert alert-info{/if}">
			<yield/>
		</ps-alert>

		{if $ps_version == 1.5}

			<style scoped>
				.hint {
					display: block;
					margin: 0 0 10px 0;
				}
			</style>

		{/if}

	</ps-alert-hint>
</script>
