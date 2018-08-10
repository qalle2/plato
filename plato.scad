// The four non-built-in Platonic solids for OpenSCAD (regular tetrahedron,
// octahedron, dodecahedron and icosahedron).
// By Kalle (http://qalle.net).

module tetrahedron() {
    // regular tetrahedron (centered at origin, edge length 1)
    // http://en.wikipedia.org/wiki/Equilateral_triangle
    // http://en.wikipedia.org/wiki/Tetrahedron#Regular_tetrahedron

    a = 1 / 2;         // edge length / 2
    b = sqrt(3) / 6;   // radius of incircle of faces
    c = sqrt(3) / 3;   // radius of circumcircle of faces
    d = sqrt(6) / 12;  // radius of insphere
    e = sqrt(6) / 4;   // radius of circumsphere

    polyhedron(
        // vertices
        [
            [ 0,  0,  e],  // 0: top
            [ 0,  c, -d],  // 1: bottom front
            [-a, -b, -d],  // 2: bottom rear left
            [ a, -b, -d],  // 3: bottom rear right
        ],
        // faces
        [
            [0, 1, 3],  // right
            [0, 2, 1],  // left
            [0, 3, 2],  // rear
            [1, 2, 3],  // bottom
        ]
    );
}

module octahedron() {
    // regular octahedron (centered at origin, edge length 1)
    // http://en.wikipedia.org/wiki/Octahedron#Regular_octahedron

    a = 1 / 2;        // edge length / 2
    b = sqrt(2) / 2;  // radius of circumsphere

    polyhedron(
        // vertices
        [
            [ 0,  0,  b],  // 0: top
            [-a,  a,  0],  // 1: front left
            [ a,  a,  0],  // 2: front right
            [ a, -a,  0],  // 3: rear right
            [-a, -a,  0],  // 4: rear left
            [ 0,  0, -b],  // 5: bottom
        ],
        // faces
        [
            [0, 1, 2],  // top front
            [0, 2, 3],  // top right
            [0, 3, 4],  // top rear
            [0, 4, 1],  // top left
            [1, 5, 2],  // bottom front
            [2, 5, 3],  // bottom right
            [3, 5, 4],  // bottom rear
            [1, 4, 5],  // bottom left
        ]
    );
}

module dodecahedron() {
    // regular dodecahedron (centered at origin, edge length 1)
    // http://en.wikipedia.org/wiki/Regular_dodecahedron
    //
    // phi = (1 + sqrt(5)) / 2
    // phi^2 = phi + 1
    //
    // if edge = 2/phi, coordinates of vertices are:
    //     (+-1, +-1, +-1)
    //     circular permutations of (0, +-phi, +-1/phi)
    // to get coordinates with edge length 1, multiply them by phi/2:
    //     (+-phi/2, +-phi/2, +-phi/2)
    //     circular permutations of (0, +-(phi+1)/2, +-1/2)

    a = (1 + sqrt(5)) / 4;  // phi / 2
    b = (3 + sqrt(5)) / 4;  // (phi + 1) / 2
    c = 1 / 2;

    polyhedron(
        // vertices
        [
            [ 0,  b,  c],  //  0: front top
            [ 0,  b, -c],  //  1: front bottom
            [ 0, -b,  c],  //  2: rear top
            [ 0, -b, -c],  //  3: rear bottom
            [ c,  0,  b],  //  4: top right
            [ c,  0, -b],  //  5: bottom right
            [-c,  0,  b],  //  6: top left
            [-c,  0, -b],  //  7: bottom left
            [ a,  a,  a],  //  8: top front right
            [ a,  a, -a],  //  9: bottom front right
            [ a, -a,  a],  // 10: top rear right
            [ a, -a, -a],  // 11: bottom rear right
            [-a,  a,  a],  // 12: top front left
            [-a,  a, -a],  // 13: bottom front left
            [-a, -a,  a],  // 14: top rear left
            [-a, -a, -a],  // 15: bottom rear left
            [ b,  c,  0],  // 16: right front
            [ b, -c,  0],  // 17: right rear
            [-b,  c,  0],  // 18: left front
            [-b, -c,  0],  // 19: left rear
        ],
        // faces
        [
            [ 0,  1,  9, 16,  8],  // front right
            [ 0,  8,  4,  6, 12],  // top front
            [ 0, 12, 18, 13,  1],  // front left
            [ 1, 13,  7,  5,  9],  // bottom front
            [ 2,  3, 15, 19, 14],  // rear left
            [ 2, 10, 17, 11,  3],  // rear right
            [ 2, 14,  6,  4, 10],  // top rear
            [ 3, 11,  5,  7, 15],  // bottom rear
            [ 4,  8, 16, 17, 10],  // right top
            [ 5, 11, 17, 16,  9],  // right bottom
            [ 6, 14, 19, 18, 12],  // left top
            [ 7, 13, 18, 19, 15],  // left bottom
        ]
    );
}

module icosahedron() {
    // regular icosahedron (centered at origin, edge length 1)
    // http://en.wikipedia.org/wiki/Regular_icosahedron

    // coordinates of vertices:
    //     circular permutations of 0, +-1/2, +-phi/2

    a = 1 / 2;
    b = (1 + sqrt(5)) / 4;  // phi/2

    polyhedron(
        // vertices
        [
            [ b,  0,  a],  //  0: right top
            [ b,  0, -a],  //  1: right bottom
            [-b,  0,  a],  //  2: left top
            [-b,  0, -a],  //  3: left bottom
            [ a,  b,  0],  //  4: front right
            [ a, -b,  0],  //  5: rear right
            [-a,  b,  0],  //  6: front left
            [-a, -b,  0],  //  7: rear left
            [ 0,  a,  b],  //  8: top front
            [ 0,  a, -b],  //  9: bottom front
            [ 0, -a,  b],  // 10: top rear
            [ 0, -a, -b],  // 11: bottom rear
        ],
        // faces
        [
            [ 0,  1,  5],  // right rear
            [ 0,  4,  1],  // right front
            [ 0,  5, 10],  // top rear right
            [ 0,  8,  4],  // top front right
            [ 0, 10,  8],  // top right
            [ 1,  4,  9],  // bottom front right
            [ 1,  9, 11],  // bottom right
            [ 1, 11,  5],  // bottom rear right
            [ 2,  3,  6],  // left front
            [ 2,  6,  8],  // top front left
            [ 2,  7,  3],  // left rear
            [ 2,  8, 10],  // top left
            [ 2, 10,  7],  // top rear left
            [ 3,  7, 11],  // bottom rear left
            [ 3,  9,  6],  // bottom front left
            [ 3, 11,  9],  // bottom left
            [ 4,  6,  9],  // front bottom
            [ 4,  8,  6],  // front top
            [ 5,  7, 10],  // rear top
            [ 5, 11,  7],  // rear bottom
        ]
    );
}

// demo
translate([-2, -2]) tetrahedron();
translate([ 2, -2]) octahedron();
translate([-2,  2]) dodecahedron();
translate([ 2,  2]) icosahedron();
