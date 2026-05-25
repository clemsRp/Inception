
let flag = true;
const billy = document.querySelector("#billy");
const line = "<li><pre>                              |  |  |  |                          ||  |        </pre></li>";

function add_legs(nb_legs)
{
	for (let i = 0; i < nb_legs; i++)
		billy.innerHTML += line;
}

add_legs(15);

function display_price()
{

}

let dernierePosition = 0;
window.addEventListener('scroll', () => {
	const positionActuelle = window.scrollY || window.pageYOffset;

	if (flag && billy.innerHTML.length >= 50000)
	{
		display_price();
		flag = false;
	}

	if (flag && (
		positionActuelle >= dernierePosition ||
		positionActuelle === window.innerHeight
	))
		add_legs(10);

	dernierePosition = positionActuelle;
});
