
const billy = document.querySelector("#billy");
const line = "<li><pre>                              |  |  |  |                          ||  |        </pre></li>";

let flag = true;
const scroll = true;
const infinity_scroll = true;

function add_legs(nb_legs)
{
	for (let i = 0; i < nb_legs; i++)
		billy.innerHTML += line;
}

add_legs(15);

if (scroll)
{
	let dernierePosition = 0;
	window.addEventListener('scroll', () => {
		const positionActuelle = window.scrollY || window.pageYOffset;
		
		if (!infinity_scroll && flag && billy.innerHTML.length >= 50000)
			flag = false;
		
		if (flag && (
			positionActuelle >= dernierePosition ||
			positionActuelle === window.innerHeight
		))
		add_legs(10);

		dernierePosition = positionActuelle;
	});
}
