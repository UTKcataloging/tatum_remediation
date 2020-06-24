SCHEMAS="test_schemas/schemas.xsd"
TATUM="../cleaned_data/modsxml"


testShunitIntalled() {
    assertNotNull $(which shunit2)
}

testIfCollectionRecordsValid() {
    for filename in $TATUM/*.xml; do
        RESPONSE=$(xmllint --noout --schema ${SCHEMAS} ${filename} 2>&1 1>/dev/null | cat)
        assertEquals "${RESPONSE}" "${filename} validates"
    done
}

. shunit2