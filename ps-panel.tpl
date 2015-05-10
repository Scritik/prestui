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
	<ps-panel-footer>
		<div class="{if $ps_version == '1.6'}panel-footer{else}margin-form{/if}">
			<yield/>
		</div>
	</ps-panel-footer>
</script>

<script type="riot/tag">
	<ps-panel-footer-submit>

		{if $ps_version == '1.6'}

			<button type="submit" class="btn btn-default pull-{ opts.direction }" name="{ opts.name }">
				<i class="process-icon-{ opts.icon }"></i> { opts.title }
			</button>

		{else}

			<input type="submit" name="{ opts.name }" value="{ opts.title }" class="button">

		{/if}

	</ps-panel-footer-submit>
</script>

<script type="riot/tag">
	<ps-panel-footer-link>

		{if $ps_version == '1.6'}

			<a class="btn btn-default pull-{ opts.direction }" href="{ opts.href }">
				<i class="process-icon-{ opts.icon }"></i> { opts.title }
			</a>

		{else}

			<a href="{ opts.href }" class="button">{ opts.title }</a>

		{/if}

	</ps-panel-footer-link>
</script>

<script type="riot/tag">
	<ps-panel>

		{if $ps_version == '1.6'}

			<div class="panel">
				<div class="panel-heading" if={ opts.icon || opts.header }>
						<i class="{ opts.icon }" if={ opts.icon }></i> { opts.header }
				</div>

				<yield/>

			</div>

		{else}

			<fieldset>
				<legend><img src="{ opts.img }">{ opts.header }</legend>

				<yield/>

			</fieldset>

			<style scoped>

				fieldset {
					margin-bottom: 20px;
				}

			</style>

		{/if}

	</ps-panel>
</script>



<script type="text/javascript">
	tags.push('ps-panel', 'ps-panel-footer', 'ps-panel-footer-link', 'ps-panel-footer-submit');
</script>
