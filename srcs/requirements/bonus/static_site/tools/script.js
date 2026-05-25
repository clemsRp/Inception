
const billy = document.querySelector("#billy");
const line = "<li><pre>               | | | |             || |      </pre></li>";

function add_legs(nb_legs)
{
	for (let i = 0; i < nb_legs; i++)
		billy.innerHTML += line;
}

function suppr_legs(nb_legs)
{
	for (let i = 0; i < nb_legs; i++)
	{
		if (billy.innerHTML.length >= 1600)
			billy.innerHTML = billy.innerHTML.slice(0, -line.length);
	}
}

add_legs(4);

let dernierePosition = 0;
window.addEventListener('scroll', () => {
	const positionActuelle = window.scrollY || window.pageYOffset;

	if (positionActuelle > dernierePosition)
		add_legs(10);
	else
		suppr_legs(30);

	dernierePosition = positionActuelle;
});
