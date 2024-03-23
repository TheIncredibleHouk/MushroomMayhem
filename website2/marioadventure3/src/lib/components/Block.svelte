<script>
	export let boltSize = 2;
	export let color = 'black';
</script>

<div class="bolt" style:--bolt-size="{boltSize}px"
                  style:--bolt-color={color}>
	<span class="bolt_1" />
	<span class="bolt_2" />
	<span class="bolt_3" />
	<span class="bolt_4" />
	<div class="block-layout">
		<slot />
	</div>
</div>

<style type="css">
	.bolt {
		border: var(--bolt-size) solid #000000;
		background: linear-gradient(160deg, white, var(--bolt-color), black) border-box;
		position: relative;
		padding: var(--bolt-size);
	}

	.bolt_1,
	.bolt_2,
	.bolt_3,
	.bolt_4 {
		height: var(--bolt-size);
		width: var(--bolt-size);
		background-color: #000000;
		display: block;
		position: absolute;
		margin: calc(var(--bolt-size) * 2);
	}

	.bolt_1 {
		left: 0;
		top: 0;
	}

	.bolt_2 {
		top: 0;
		right: 0;
	}

	.bolt_3 {
		left: 0;
		bottom: 0;
	}

	.bolt_4 {
		right: 0;
		bottom: 0;
	}

	.block-layout {
		background-color: var(--bolt-color);
		padding: calc(var(--bolt-size) * 3);
	}
</style>
