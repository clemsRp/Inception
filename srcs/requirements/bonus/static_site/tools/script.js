
let flag = true;
const billy = document.querySelector("#billy");
const line = "<li><pre>                              |  |  |  |                          ||  |        </pre></li>";

const urlParams = new URLSearchParams(window.location.search);

let scroll = true;
let infinity_scroll = true;

const scroll_res = urlParams.get('scroll');
const infinity_scroll_res = urlParams.get('infinity_scroll');

if (scroll_res !== null)
	scroll = scroll_res === "true";
if (infinity_scroll_res !== null)
	infinity_scroll = infinity_scroll_res === "true";

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
