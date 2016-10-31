package main_test

import (
	. "github.com/onsi/ginkgo"
	. "github.com/onsi/gomega"
)

var _ = Describe("Concourse Tutorial", func() {
	Describe("Dummy test", func() {
		Context("Where a string", func() {
			It("should be equals another", func() {
				Expect("HELLO").To(Equal("HELLO"))
			})
		})
	})
})
