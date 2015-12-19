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
	<ps-alert>

		{if $ps_version == '1.6'}

			<div class="alert { opts['oneSixClass'] }">
				<button type="button" class="close" data-dismiss="alert">×</button>
				<yield/>
			</div>

		{else}

			{if $ps_version == '1.5'}

				<div class="{ opts['oneFiveClass'] }">

			{else}

				<div class="{ opts['oneFourClass'] }">
					<img src="{ opts.img }" if={ opts.img }>
			{/if}

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
					top: {if $ps_version == '1.5'}15{else}12{/if}px;
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

		<ps-alert one-six-class="module_confirmation conf confirm alert-success" one-five-class="module_confirmation conf confirm" one-four-class="conf" img="../img/admin/ok2.png"><yield/></ps-alert>

	</ps-alert-success>
</script>

<script type="riot/tag">
	<ps-alert-error>

		<ps-alert one-six-class="alert-danger" one-five-class="module_error alert error" one-four-class="error" img="../img/admin/error2.png"><yield/></ps-alert>

	</ps-alert-error>
</script>

<script type="riot/tag">
	<ps-alert-warn>

		<ps-alert one-six-class="alert-warning" one-five-class="warn" one-four-class="warn" img="../img/admin/warn2.png"><yield/></ps-alert>

	</ps-alert-warn>
</script>

<script type="riot/tag">
	<ps-alert-hint>

		<ps-alert one-six-class="alert-info" one-five-class="hint" one-four-class="hint clear"><yield/></ps-alert>

		{if $ps_version != '1.6'}

			<style scoped>
				.hint {
					display: block;
					margin: 0 0 10px 0;
					{if $ps_version == '1.4'}
						padding: 10px 15px 10px 45px;
						background-position-x: 10px;
					{/if}
				}

				{if $ps_version == '1.4'}
					img.close {
						top: 10px;
					}
				{/if}
			</style>

		{/if}

	</ps-alert-hint>
</script>

<script type="text/javascript">
	tags.push('ps-alert-success',
						'ps-alert-error',
						'ps-alert-hint',
						'ps-alert-warn');
</script>